require "part_1"

describe "PHASE 1" do
  describe "some?" do
    it "should accept an array and a block as argument" do
      expect { some?([3, 1, 11, 5]) { |n| n.even? } }.to_not raise_error
    end

    context "when atleast one element is true" do
      it "should return true" do
        expect(some?([3, 4, 11, 5]) { |n| n.even? }).to eq(true)
        expect(some?([8, 2]) { |n| n.even? }).to eq(true)
        expect(some?(['squash', 'corn', 'kale', 'potato']) { |str| str[0] == 'p' }).to eq(true)
        expect(some?(['parsnip', 'lettuce', 'pea']) { |str| str[0] == 'p' }).to eq(true)
      end
    end

    context "when none of the elements are true" do
      it "should return false" do
        expect(some?([3, 1, 11, 5]) { |n| n.even? }).to eq(false)
        expect(some?(['squash', 'corn', 'kale', 'carrot']) { |str| str[0] == 'p' }).to eq(false)
      end
    end

    it "should use Array#each" do
      array = [3, 4, 11, 5]
      expect(array).to receive(:each).at_least(:once)
      some?(array) { |n| n.even? }
    end
  end

  describe "exactly?" do
    it "should accept an array, a number and a block" do
      expect { exactly?(['A', 'b', 'C'], 2) { |el| el == el.upcase } }.to_not raise_error
    end

    context "when the blocks is true the n elements of times" do
      it "should return true" do
        expect(exactly?(['A', 'b', 'C'], 2) { |el| el == el.upcase }).to eq(true)
        expect(exactly?(['A', 'B', 'C'], 3) { |el| el == el.upcase }).to eq(true)
        expect(exactly?(['cat', 'DOG', 'bird'], 1) { |el| el == el.upcase }).to eq(true)
        expect(exactly?(['cat', 'dog', 'bird'], 0) { |el| el == el.upcase }).to eq(true)
        expect(exactly?([4, 5, 2], 3) { |n| n > 0 }).to eq(true)
        expect(exactly?([42, -9, 7, -3, -6], 2) { |n| n > 0 }).to eq(true)
      end
    end

    context "when the block does not match the n elements of times" do
      it "should return false" do
        expect(exactly?(['A', 'B', 'C'], 2) { |el| el == el.upcase }).to eq(false)
        expect(exactly?(['cat', 'DOG', 'bird'], 0) { |el| el == el.upcase }).to eq(false)
        expect(exactly?([4, 5], 3) { |n| n > 0 }).to eq(false)
      end
    end

    it "should use Array#each" do
      array = ['cat', 'DOG', 'bird']
      expect(array).to receive(:each).at_least(:once)
      exactly?(array, 2) { |el| el == el.upcase }
    end
  end

  describe "filter_out" do
    it "should accept an array and a block as arguments" do
      expect { filter_out([10, 6, 3, 2, 5 ]) { |x| x.odd? } }.to_not raise_error
    end

    it "should remove the elements from the array that return true in the block" do
      expect(filter_out([10, 6, 3, 2, 5 ]) { |x| x.odd? }).to eq([10, 6, 2])
      expect(filter_out([1, 7, 3, 5 ]) { |x| x.odd? }).to eq([])
      expect(filter_out([10, 6, 3, 2, 5 ]) { |x| x.even? }).to eq([3, 5])
      expect(filter_out([1, 7, 3, 5 ]) { |x| x.even? }).to eq([1, 7, 3, 5])
    end

    it "should use Array#each" do
      array = [10, 6, 3, 2, 5 ]
      expect(array).to receive(:each).at_least(:once)
      filter_out(array) { |x| x.odd? }
    end
  end

  describe "at_least?" do
    it "should accept an array, a number(n), and a block as an argument" do
      expect { at_least?(['sad', 'quick', 'timid', 'final'], 2) { |s| s.end_with?('ly') } }.to_not raise_error
    end

    context "when all of the elements match the number (n)" do
      it "should return true" do
        expect(at_least?(['sad', 'quickly', 'timidly', 'final'], 2) { |s| s.end_with?('ly') }).to eq(true)
        expect(at_least?(['sad', 'quickly', 'timidly', 'finally'], 2) { |s| s.end_with?('ly') }).to eq(true)
        expect(at_least?(['sad', 'quickly', 'timid', 'final'], 1) { |s| s.end_with?('ly') }).to eq(true)
        expect(at_least?([true, true, true], 3) { |bool| bool }).to eq(true)
        expect(at_least?([true, true, true, true], 3) { |bool| bool }).to eq(true)
      end
    end

    context "when none of the elements in the block match the number (n)" do
      it "should return false" do
        expect(at_least?(['sad', 'quick', 'timid', 'final'], 2) { |s| s.end_with?('ly') }).to eq(false)
        expect(at_least?(['sad', 'quickly', 'timid', 'final'], 2) { |s| s.end_with?('ly') }).to eq(false)
        expect(at_least?(['sad', 'quick', 'timid', 'final'], 1) { |s| s.end_with?('ly') }).to eq(false)
        expect(at_least?([false, false, false], 3) { |bool| bool }).to eq(false)
        expect(at_least?([false, true, true], 3) { |bool| bool }).to eq(false)
      end
    end

    it "should use Array#each" do
      array = ['sad', 'quick', 'timid', 'final']
      expect(array).to receive(:each).at_least(:once)
      at_least?(array, 2) { |s| s.end_with?('ly') }
    end
  end

  describe "every?" do
    it "should accept an array and a block as arguments" do
      expect { every?([3, 1, 11, 5]) { |n| n.even? } }.to_not raise_error
    end

    context "when all the elements in the block are true" do
      it "should return true" do
        expect(every?([2, 4, 4, 8]) { |n| n.even? }).to eq(true)
        expect(every?([8, 2]) { |n| n.even? }).to eq(true)
        expect(every?(['parsnip', 'potato', 'pea']) { |str| str[0] == 'p' }).to eq(true)
      end
    end

    context "when at least one element fails in the block" do
      it "should return false" do
        expect(every?([3, 1, 11, 5]) { |n| n.even? }).to eq(false)
        expect(every?(['squash', 'corn', 'kale', 'carrot']) { |str| str[0] == 'p' }).to eq(false)
        expect(every?(['squash', 'pea', 'kale', 'potato']) { |str| str[0] == 'p' }).to eq(false)
      end
    end

    it "should use Array#each" do
      array = [3, 1, 11, 5]
      expect(array).to receive(:each).at_least(:once)
      every?(array) { |n| n.even? }
    end
  end

  describe "at_most?" do
    it "should accept an array, a number (n) and a block" do
      expect { at_most?([-4, 100, -3], 1) { |el| el > 0 } }.to_not raise_error
    end

    context "when no more than n elements of the array return true" do
      it "should return true" do
        expect(at_most?([-4, 100, -3], 1) { |el| el > 0 }).to eq(true)
        expect(at_most?([-4, -100, -3], 1) { |el| el > 0 }).to eq(true)
        expect(at_most?(['r', 'q', 'e', 'z'], 2) { |el| 'aeiou'.include?(el) }).to eq(true)
        expect(at_most?(['r', 'i', 'e', 'z'], 2) { |el| 'aeiou'.include?(el) }).to eq(true)
      end
    end

    context "when more than n elements of the array return true" do
      it "should return false" do
        expect(at_most?([4, 100, -3], 1) { |el| el > 0 }).to eq(false)
        expect(at_most?([4, 100, 3], 1) { |el| el > 0 }).to eq(false)
        expect(at_most?(['r', 'i', 'e', 'o'], 2) { |el| 'aeiou'.include?(el) }).to eq(false)
      end
    end

    it "should use Array#each" do
      array = [-4, 100, -3]
      expect(array).to receive(:each).at_least(:once)
      at_most?(array, 1) { |el| el > 0 }
    end
  end

  describe "first_index" do
    it "should accept an array and a block as argument" do
      expect { first_index(['bit', 'cat', 'byte', 'below']) { |el| el.length > 3 } }.to_not raise_error
    end

    context "when the block returns true" do
      it "should return the first element of the array" do
        expect(first_index(['bit', 'cat', 'byte', 'below']) { |el| el.length > 3 }).to eq(2)
        expect(first_index(['bitten', 'bit', 'cat', 'byte', 'below']) { |el| el.length > 3 }).to eq(0)
        expect(first_index(['bit', 'cat', 'byte', 'below']) { |el| el[0] == 'b' }).to eq(0)
        expect(first_index(['bit', 'cat', 'byte', 'below']) { |el| el.include?('a') }).to eq(1)
      end
    end

    context "when all the elements return false" do
      it "should return nil" do
        expect(first_index(['bitten', 'bit', 'cat', 'byte', 'below']) { |el| el.length > 6 }).to eq(nil)
        expect(first_index(['bit', 'cat', 'byte', 'below']) { |el| el[0] == 't' }).to eq(nil)
      end
    end

    it "should use Array#each" do
      array = ['bit', 'cat', 'byte', 'below']
      expect(array).to receive(:each).at_least(:once)
      first_index(array) { |el| el.length > 3 }
    end
  end
end