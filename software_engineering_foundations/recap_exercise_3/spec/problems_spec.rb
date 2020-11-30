require "problems"

describe "no_dupes?" do
    it "should accept an array as args" do
        expect { no_dupes?([1, 1, 2, 1, 3, 2, 4]) }.to_not raise_error
    end

    it "should return a new array containing the elements that were not repeated" do
        expect(partition([1, 1, 2, 1, 3, 2, 4])).to eq([3, 4])
        expect(['x', 'x', 'y', 'z', 'z']).to eq(['y'])
        expect([true, true, true]).to eq([])
    end

end

describe "no_consecutive_repeats?" do
    it "should accept an array as args" do
        expect { no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog']) }.to_not raise_error
    end

    it "should return true if an element never appears consecutively in the array" do
        expect().to eq(true)
        expect(no_consecutive_repeats?(['cat', 'dog', 'mouse', 'dog']).to eq(true)
        expect(no_consecutive_repeats?(['cat', 'dog', 'dog', 'mouse']).to eq(false)
        expect(no_consecutive_repeats?([10, 42, 3, 7, 10, 3]).to eq(true)
        expect(no_consecutive_repeats?([10, 42, 3, 3, 10, 3]).to eq(false)
        expect(no_consecutive_repeats?(['x']).to eq(true)
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