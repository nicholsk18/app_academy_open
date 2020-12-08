require "problems"

describe "no_dupes?" do
    it "should accept an array as args" do
        expect { no_dupes?([1, 1, 2, 1, 3, 2, 4]) }.to_not raise_error
    end

    it "should return a new array containing the elements that were not repeated" do
        expect(no_dupes?([1, 1, 2, 1, 3, 2, 4])).to eq([3, 4])
        expect(no_dupes?(['x', 'x', 'y', 'z', 'z'])).to eq(['y'])
        expect(no_dupes?([true, true, true])).to eq([])
    end

end

describe "no_consecutive_repeats?" do
    it "should accept an array as args" do
        expect { no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog']) }.to_not raise_error
    end

    it "should return true if an element never appears consecutively in the array" do
        expect(no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog'])).to eq(true)
        expect(no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse'])).to eq(false)
        expect(no_consecutive_repeats?([10, 42, 3, 7, 10, 3])).to eq(true)
        expect(no_consecutive_repeats?([10, 42, 3, 3, 10, 3])).to eq(false)
        expect(no_consecutive_repeats?(['x'])).to eq(true)
    end
end

describe "char_indices" do
    it "should take string as an arg" do
        expect { char_indices('mississippi') }.to_not raise_error
    end

    it "should return a hash containing characters as keys and value as array of indices where that character was found" do
        expect(char_indices('mississippi')).to eq({"m"=>[0], "i"=>[1, 4, 7, 10], "s"=>[2, 3, 5, 6], "p"=>[8, 9]})
        expect(char_indices('classroom')).to eq({"c"=>[0], "l"=>[1], "a"=>[2], "s"=>[3, 4], "r"=>[5], "o"=>[6, 7], "m"=>[8]})
    end
end

describe "longest_streak" do
    it "should accept a string as an arg" do
        expect { longest_streak('a') }.to_not raise_error
    end

    it "should return a string of the longest consecutive characters" do
        expect(longest_streak('a')).to eq('a')
        expect(longest_streak('accccbbb')).to eq('cccc')
        expect(longest_streak('aaaxyyyyyzz')).to eq('yyyyy')
        expect(longest_streak('aaabbb')).to eq('bbb')
        expect(longest_streak('abc')).to eq('c')
    end
end

describe "bi_prime?" do
    it "should accept a number as an arg" do
        expect { bi_prime?(14) }.to_not raise_error
    end

    it "should return a boolean indicating whether or not the number is a bi-prime" do
        expect(bi_prime?(14)).to eq(true)
        expect(bi_prime?(22)).to eq(true)
        expect(bi_prime?(25)).to eq(true)
        expect(bi_prime?(94)).to eq(true)
        expect(bi_prime?(24)).to eq(false)
        expect(bi_prime?(64)).to eq(false)
    end
end

describe "vigenere_cipher" do
  it "should accept a message and keys" do
    expect { vigenere_cipher("toerrishuman", [1]) }.to_not raise_error
  end

  it "should return the encrypted message" do
      expect(vigenere_cipher("toerrishuman", [1])).to eq("upfssjtivnbo")
      expect(vigenere_cipher("toerrishuman", [1, 2])).to eq("uqftsktjvobp")
      expect(vigenere_cipher("toerrishuman", [1, 2, 3])).to eq("uqhstltjxncq")
      expect(vigenere_cipher("zebra", [3, 0])).to eq("ceerd")
      expect(vigenere_cipher("yawn", [5, 1])).to eq("dbbo")
  end
end

describe "vowel_rotate" do
  it "should accept a string as an arg" do
    expect { vowel_rotate('computer') }.to_not raise_error
  end

  it "should return a string where every vowel is replaced with the vowel tha appears vefore it sequentially" do
      expect(vowel_rotate('computer')).to eq("cempotur")
      expect(vowel_rotate('oranges')).to eq("erongas")
      expect(vowel_rotate('headphones')).to eq("heedphanos")
      expect(vowel_rotate('bootcamp')).to eq("baotcomp")
      expect(vowel_rotate('awesome')).to eq("ewasemo")
  end
end

describe "String" do
  describe "#select" do
    it "should return a new string containing characters of the original string that return true when passed in to the block" do
        expect("app academy".select { |ch| !"aeiou".include?(ch) }).to eq("pp cdmy")
        expect("HELLOworld".select { |ch| ch == ch.upcase }).to eq("HELLO")
        expect("HELLOworld".select).to eq("")
    end
  end

  describe "#map!" do
    it "should mutate the existing string" do
      word_1 = "Lovelace"
      word_2 = "Dijkstra"

      expect(word_1.map! do |ch|
          if ch == 'e'
              '3'
          elsif ch == 'a'
              '4'
          else
              ch
          end
      end).to be(word_1)
      expect(word_1).to eq("Lov3l4c3")

      expect(word_2.map! do |ch, i|
          if i.even?
              ch.upcase
          else
              ch.downcase
          end
      end).to be(word_2)
      expect(word_2).to eq("DiJkStRa")
    end
  end
end

describe "Recursion problems" do
  describe "multiply" do
      it "should take two numbers" do
          expect { multiply(3, 5) }.to_not raise_error
      end

      it "should return the product of two numbers" do
          expect(multiply(3, 5)).to eq(15)
          expect(multiply(5, 3)).to eq(15)
          expect(multiply(2, 4)).to eq(8)
          expect(multiply(0, 10)).to eq(0)
          expect(multiply(-3, -6)).to eq(18)
          expect(multiply(3, -6)).to eq(-18)
          expect(multiply(-3, 6)).to eq(-18)
      end

      it "should be recursive" do
          expect(self).to receive(:multiply).at_least(:twice).and_call_original
          multiply(3, 5)
      end
  end

  describe "lucas_sequence" do
    it "should take a number as arg" do
      expect { lucas_sequence(0) }.to_not raise_error
    end

    it "should return an array containing the Lucas Sequence up to the giben length" do
      expect(lucas_sequence(0)).to eq([])
      expect(lucas_sequence(1)).to eq([2])
      expect(lucas_sequence(2)).to eq([2, 1])
      expect(lucas_sequence(3)).to eq([2, 1, 3])
      expect(lucas_sequence(6)).to eq([2, 1, 3, 4, 7, 11])
      expect(lucas_sequence(8)).to eq([2, 1, 3, 4, 7, 11, 18, 29])
    end

    it "should be recursive" do
      # expect(self).to receive(:lucas_sequence).at_least(:twice).and_call_original
      # lucas_sequence(0)
    end
  end

  describe "prime_factorization" do
    it "should return an array representing the prime factorization of the given number" do
        expect(prime_factorization(12)).to eq([2, 2, 3])
        expect(prime_factorization(24)).to eq([2, 2, 2, 3])
        expect(prime_factorization(25)).to eq([5, 5])
        expect(prime_factorization(60)).to eq([2, 2, 3, 5])
        expect(prime_factorization(7)).to eq([7])
        expect(prime_factorization(11)).to eq([11])
        expect(prime_factorization(2017)).to eq([2017])
    end

    it "should be recursive" do
      expect(self).to receive(:prime_factorization).at_least(:twice).and_call_original
      prime_factorization(12)
    end
  end
end