def matrix_addition_reloaded(*matrices)
  matrix = matrices.first
  height = matrix.length
  width = matrix[0].length

  empty_matrix = Array.new(height) { [0] * width }
  matrices.inject(empty_matrix) do |m1, m2|
    return nil if m2.length != height or m2[0].length != width
    matrix_addition(m1, m2)
  end
end

def squarocol?(arrays)
  (0...arrays.length).each do |i|
    return true if arrays[i].uniq.length == 1
    temp = []
    (0...arrays.length).each do |j|
      temp << arrays[j][i]
    end
    
    return true if temp.uniq.length == 1
  end

  false
end

def squaragonal?(arrays)

end

def pascals_triangle(number)

end