require "part_2"

describe "PHASE 2" do
  describe "anti_prime?" do
    it "should accept a number as argument" do
      expect { anti_prime?(24) }.to_not raise_error
    end

    context "when the given number has more divisors than all positive numbers less than the given number" do
      it "should return true" do
        expect(anti_prime?(24)).to eq(true)
        expect(anti_prime?(36)).to eq(true)
        expect(anti_prime?(48)).to eq(true)
        expect(anti_prime?(360)).to eq(true)
        expect(anti_prime?(1260)).to eq(true)
      end
    end

    context "when the given number has less divisors than all positive numbers more than the given number" do
      it "should return false" do
        expect(anti_prime?(27)).to eq(false)
        expect(anti_prime?(5)).to eq(false)
        expect(anti_prime?(100)).to eq(false)
        expect(anti_prime?(136)).to eq(false)
        expect(anti_prime?(1024)).to eq(false)
      end
    end
  end

  describe "matrix_addition" do
    it "should accept two matrices as arguments" do
      expect { matrix_addition([[2,5], [4,7]], [[9,1], [3,0]]) }.to_not raise_error
    end

    it "should return a new matrix representing the sum of the two arguments" do
      matrix_a = [[2,5], [4,7]]
      matrix_b = [[9,1], [3,0]]
      matrix_c = [[-1,0], [0,-1]]
      matrix_d = [[2, -5], [7, 10], [0, 1]]
      matrix_e = [[0 , 0], [12, 4], [6,  3]]

      expect(matrix_addition(matrix_a, matrix_b)).to eq([[11, 6], [7, 7]])
      expect(matrix_addition(matrix_a, matrix_c)).to eq([[1, 5], [4, 6]])
      expect(matrix_addition(matrix_b, matrix_c)).to eq([[8, 1], [3, -1]])
      expect(matrix_addition(matrix_d, matrix_e)).to eq([[2, -5], [19, 14], [6, 4]])
    end
  end

  describe "mutual_factors" do
    it "should accept any amount of numbers as arguments" do
      expect { mutual_factors(50, 30) }.to_not raise_error
      expect { mutual_factors(50, 30, 45, 105) }.to_not raise_error
    end

    it "should return an array containing all of the common divisors shared among the arguments" do
      expect(mutual_factors(50, 30)).to eq([1, 2, 5, 10])
      expect(mutual_factors(50, 30, 45, 105)).to eq([1, 5])
      expect(mutual_factors(8, 4)).to eq([1, 2, 4])
      expect(mutual_factors(8, 4, 10)).to eq([1, 2])
      expect(mutual_factors(12, 24)).to eq([1, 2, 3, 4, 6, 12])
      expect(mutual_factors(12, 24, 64)).to eq([1, 2, 4])
      expect(mutual_factors(22, 44)).to eq([1, 2, 11, 22])
      expect(mutual_factors(22, 44, 11)).to eq([1, 11])
      expect(mutual_factors(7)).to eq([1, 7])
      expect(mutual_factors(7, 9)).to eq([1])
    end
  end

  describe "tribonacci_number" do
    it "should accept a number as an argument" do
      expect { tribonacci_number(1) }.to_not raise_error
    end

    it "should return the n-th number of the tribonacci sequence" do
      expect(tribonacci_number(1)).to eq(1)
      expect(tribonacci_number(2)).to eq(1)
      expect(tribonacci_number(3)).to eq(2)
      expect(tribonacci_number(4)).to eq(4)
      expect(tribonacci_number(5)).to eq(7)
      expect(tribonacci_number(6)).to eq(13)
      expect(tribonacci_number(7)).to eq(24)
      expect(tribonacci_number(11)).to eq(274)
    end
  end
end