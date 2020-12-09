require "part_2"

describe "PHASE 2" do
  describe "xnor_select" do
    it "should accept an array and two procs" do
      is_even = Proc.new { |n| n % 2 == 0 }
      is_positive = Proc.new { |n| n > 0 }

      expect { xnor_select([8, 3, -4, -5], is_even, is_positive) }.to_not raise_error
    end

    it "should return a new array containing elements of the original array that either return true for both procs or false for both procs" do
      is_even = Proc.new { |n| n % 2 == 0 }
      is_odd = Proc.new { |n| n % 2 != 0 }
      is_positive = Proc.new { |n| n > 0 }
      expect(xnor_select([8, 3, -4, -5], is_even, is_positive)).to eq([8, -5])
      expect(xnor_select([-7, -13, 12, 5, -10], is_even, is_positive)).to eq([-7, -13, 12])
      expect(xnor_select([-7, -13, 12, 5, -10], is_odd, is_positive)).to eq([5, -10])
    end
  end

  describe "filter_out!" do
    it "should accept an array and a block" do
      expect { filter_out!([10, 6, 3, 2, 5 ]) { |x| x.odd? } }.to_not raise_error
    end

    it "should remove elements of the input array that return true in the block" do
      arr_1 = [10, 6, 3, 2, 5 ]
      filter_out!(arr_1) { |x| x.odd? }
      expect(arr_1).to be([10, 6, 2])

      arr_2 = [1, 7, 3, 5 ]
      filter_out!(arr_2) { |x| x.odd? }
      expect(arr_2).to be([])

      arr_3 = [10, 6, 3, 2, 5 ]
      filter_out!(arr_3) { |x| x.even? }
      expect(arr_3).to be([3, 5])

      arr_4 = [1, 7, 3, 5 ]
      filter_out!([1, 7, 3, 5 ]) { |x| x.even? }
      expect(arr_4).to be([1, 7, 3, 5])
    end

    it "should not use Array#reject!" do
      arr_1 = [10, 6, 3, 2, 5 ]
      expect(arr_1).to_not receive(:reject!)
      filter_out!(arr_1) { |x| x.odd? }
    end
  end

  describe "multi_map" do
    it "should accept an array, an optional number (n), and a block as argument" do
      expect { multi_map(['pretty', 'cool', 'huh?']) { |s| s + '!'} }.to_not raise_error
    end

    context "when optional number is provided" do
      it "should run array through a block once" do
        expect(multi_map(['pretty', 'cool', 'huh?']) { |s| s + '!'}).to eq(["pretty!", "cool!", "huh?!"])
      end
    end

    context "when optional number is provided" do
      it "should run the array n number of times through the block" do
        expect(multi_map(['pretty', 'cool', 'huh?'], 1) { |s| s + '!'}).to eq(["pretty!", "cool!", "huh?!"])
        expect(multi_map(['pretty', 'cool', 'huh?'], 3) { |s| s + '!'}).to eq(["pretty!!!", "cool!!!", "huh?!!!"])
        expect(multi_map([4, 3, 2, 7], 1) { |num| num * 10 }).to eq([40, 30, 20, 70])
        expect(multi_map([4, 3, 2, 7], 2) { |num| num * 10 }).to eq([400, 300, 200, 700])
        expect(multi_map([4, 3, 2, 7], 4) { |num| num * 10 }).to eq([40000, 30000, 20000, 70000])
      end
    end
  end

  describe "proctition" do
    it "should accept an array and a block as argument" do
      expect { proctition([4, -5, 7, -10, -2, 1, 3]) { |el| el > 0 } }.to_not raise_error
    end

    it "should return a new array where the elements that return true when given to the block come before all of the elements that return false when given to the block." do
      expect(proctition([4, -5, 7, -10, -2, 1, 3]) { |el| el > 0 }).to eq([4, 7, 1, 3, -5, -10, -2])
      expect(proctition([7, 8, 3, 6, 10]) { |el| el.even? }).to eq([8, 6, 10, 7, 3])
      expect(proctition(['cat','boot', 'dog', 'bug', 'boat']) { |s| s[0] == 'b' }).to eq(["boot", "bug", "boat", "cat", "dog"])
    end
  end
end