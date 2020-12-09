require "part_1"

describe "PHASE 1" do
  describe "strange_sums" do
    it "should accept an array of numbers as an argument" do
      expect { strange_sums([2, -3, 3, 4, -2]) }.to_not raise_error
    end

    it "should return a count of the number of distinct pairs of elements that have a sum of zero" do
      expect(strange_sums([2, -3, 3, 4, -2])).to eq(2)
      expect(strange_sums([42, 3, -1, -42])).to eq(1)
      expect(strange_sums([-5, 5])).to eq(1)
      expect(strange_sums([19, 6, -3, -20])).to eq(0)
      expect(strange_sums([9])).to eq(0)
    end
  end

  describe "pair_product" do
    it "should accept an array of numbers and a product as argument" do
      expect { pair_product([4, 2, 5, 8], 16) }.to_not raise_error
    end

    context "when a pair of distinct elements in the array result in the product when multiplied together" do
      it "should return true" do
        expect(pair_product([4, 2, 5, 8], 16)).to eq(true)
        expect(pair_product([8, 1, 9, 3], 8)).to eq(true)
        expect(pair_product([3, 4], 12)).to eq(true)
        expect(pair_product([3, 4, 6, 2, 5], 12)).to eq(true)
      end
    end

    context "when a pair of distinct elements in the array does not result in the product when multiplied together" do
      it "should return false" do
        expect(pair_product([4, 2, 5, 7], 16)).to eq(false)
        expect(pair_product([8, 4, 9, 3], 8)).to eq(false)
        expect(pair_product([3], 12)).to eq(false)
      end
    end
  end

  describe "rampant_repeats" do
    it "should accept a string and a hash as arguments" do
      expect { rampant_repeats('taco', {'a'=>3, 'c'=>2}) }.to_not raise_error
    end

    it "should return a new string where characters of the original string are repeated the number of times specified by the hash" do
      expect(rampant_repeats('taco', {'a'=>3, 'c'=>2})).to eq('taaacco')
      expect(rampant_repeats('feverish', {'e'=>2, 'f'=>4, 's'=>3})).to eq('ffffeeveerisssh')
      expect(rampant_repeats('misispi', {'s'=>2, 'p'=>2})).to eq('mississppi')
      expect(rampant_repeats('faarm', {'e'=>3, 'a'=>2})).to eq('faaaarm')
    end
  end

  describe "perfect_square?" do
    it "should accept a number as an argument" do
      expect { perfect_square?(1) }.to_not raise_error
    end

    context "When the argument is a perfect square" do
      it "should return true" do
        expect(perfect_square(1)).to eq(true)
        expect(perfect_square(4)).to eq(true)
        expect(perfect_square(64)).to eq(true)
        expect(perfect_square(100)).to eq(true)
        expect(perfect_square(169)).to eq(true)
      end
    end

    context "when the argument is not a perfect square" do
      it "should return false" do
        expect(perfect_square(2)).to eq(false)
        expect(perfect_square(40)).to eq(false)
        expect(perfect_square(32)).to eq(false)
        expect(perfect_square(50)).to eq(false)
      end
    end
  end
end