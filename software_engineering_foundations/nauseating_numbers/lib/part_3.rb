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
  # Better way
  # return true if grid.any? { |row| row.uniq.length == 1 }
  # return true if grid.transpose.any? { |col| col.uniq.length == 1 }
  # false

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
  left_to_right = []
  right_to_left = []

  (0...arrays.length).each do |index|
    left_to_right << arrays[index][index]
    right_to_left << arrays[index][-1 * (index+ 1)]
  end

  if (left_to_right.uniq.length == 1 || right_to_left.uniq.length == 1)
    true
  else
    false
  end
end

def adjacent_sums(arr)
  sums = []
  (0...arr.length-1).each do |i|
      sums << arr[i] + arr[i + 1]
  end
  sums
end

def pascals_triangle(number)
  triangle = [[1]]

  while triangle.length < number
      level_above = triangle.last
      next_level = [1]
      next_level += adjacent_sums(level_above)
      next_level << 1
      triangle << next_level
  end

  triangle
end