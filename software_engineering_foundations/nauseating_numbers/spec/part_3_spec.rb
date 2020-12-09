require "part_3"

describe "PHASE 3" do
  describe "matrix_addition_reloaded" do
    it "should accept any number of matrices as arguments" do
      expect { matrix_addition_reloaded([[2,5], [4,7]], [[9,1], [3,0]]) }.to_not raise_error
    end

    it "should return a new matrix representing the sum of the arguments" do
      matrix_a = [[2,5], [4,7]]
      matrix_b = [[9,1], [3,0]]
      matrix_c = [[-1,0], [0,-1]]
      matrix_d = [[2, -5], [7, 10], [0, 1]]
      matrix_e = [[0 , 0], [12, 4], [6,  3]]

      expect(matrix_addition_reloaded(matrix_a, matrix_b)).to eq([[11, 6], [7, 7]])
      expect(matrix_addition_reloaded(matrix_a, matrix_b, matrix_c)).to eq([[10, 6], [7, 6]])
      expect(matrix_addition_reloaded(matrix_e)).to eq([[0, 0], [12, 4], [6, 3]])
      expect(matrix_addition_reloaded(matrix_d, matrix_e)).to eq([[2, -5], [19, 14], [6, 4]])
      expect(matrix_addition_reloaded(matrix_a, matrix_b, matrix_e)).to eq(nil)
      expect(matrix_addition_reloaded(matrix_d, matrix_e, matrix_c)).to eq(nil)
    end
  end

  describe "squarocol?" do
    it "should accept a 2D array as an argument" do
      expect { squarocol?([[:a, :x , :d],[:b, :x , :e],[:c, :x , :f],]) }.to_not raise_error
    end

    it "should return a boolean indicating whether or not any row or column is completely filled with the same element" do
      array_1 = [
          [:a, :x , :d],
          [:b, :x , :e],
          [:c, :x , :f],
      ]
      array_2 = [
          [:x, :y, :x],
          [:x, :z, :x],
          [:o, :o, :o],
      ]
      array_3 = [
          [:o, :x , :o],
          [:x, :o , :x],
          [:o, :x , :o],
      ]
      array_4 = [
          [1, 2, 2, 7],
          [1, 6, 6, 7],
          [0, 5, 2, 7],
          [4, 2, 9, 7],
      ]
      array_5 = [
          [1, 2, 2, 7],
          [1, 6, 6, 0],
          [0, 5, 2, 7],
          [4, 2, 9, 7],
      ]

      expect(squarocol?(array_1)).to eq(true)
      expect(squarocol?(array_2)).to eq(true)
      expect(squarocol?(array_3)).to eq(false)
      expect(squarocol?(array_4)).to eq(true)
      expect(squarocol?(array_5)).to eq(false)
    end
  end

  describe "squaragonal?" do
    it "should accept 2D array as an argument" do
      expect { squaragonal?([[:x, :y, :o], [:x, :x, :x], [:o, :o, :x],]) }.to_not raise_error
    end

    it "should return a boolean indicating whether or not the array contains all of the same element across either of its diagonals" do
      array_1 = [
          [:x, :y, :o],
          [:x, :x, :x],
          [:o, :o, :x],
      ]
      array_2 = [
          [:x, :y, :o],
          [:x, :o, :x],
          [:o, :o, :x],
      ]
      array_3 = [
          [1, 2, 2, 7],
          [1, 1, 6, 7],
          [0, 5, 1, 7],
          [4, 2, 9, 1],
      ]
      array_4 = [
          [1, 2, 2, 5],
          [1, 6, 5, 0],
          [0, 2, 2, 7],
          [5, 2, 9, 7],
      ]

      expect(squaragonal?(array_1)).to eq(true)
      expect(squaragonal?(array_2)).to eq(true)
      expect(squaragonal?(array_3)).to eq(true)
      expect(squaragonal?(array_4)).to eq(false)
    end
  end

  describe "pascals_triangle" do
    it "should accept a positive number" do
      expect { pascals_triangle(5) }.to_not raise_error
    end

    it "should return 2D array representing the first n levels of pascal's triangle" do
      triangle_1 = [
           [1],
           [1, 1],
           [1, 2, 1],
           [1, 3, 3, 1],
           [1, 4, 6, 4, 1]
      ]

      triangle_2 = [
          [1],
          [1, 1],
          [1, 2, 1],
          [1, 3, 3, 1],
          [1, 4, 6, 4, 1],
          [1, 5, 10, 10, 5, 1],
          [1, 6, 15, 20, 15, 6, 1]
      ]

      expect(pascals_triangle(5)).to eq(triangle_1)
      expect(pascals_triangle(7)).to eq(triangle_2)
    end
  end
end