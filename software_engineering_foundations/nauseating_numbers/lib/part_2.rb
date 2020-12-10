def num_of_devicers(num)
  count = 0

  (1..num).each do |i|
    if (num % i == 0)
      count += 1
    end
  end

  count
end

def anti_prime?(number)
  max = num_of_devicers(number)
  anti = true

  (1...number).each do |num|
    if (num_of_devicers(num) > max)
      anti = false
    end
  end

  anti
end

def matrix_addition(matrix_1, matrix_2)
  added_matrix = []

  (0...matrix_1.length).each do |i|
    temp = []
    (0...matrix_1[i].length).each do |j|
      temp << matrix_1[i][j] + matrix_2[i][j]
    end

    added_matrix << temp
  end

  added_matrix
end

def factors(num)
  all_factors = []

  (1..num).each do |i|
    if (num % i == 0)
      all_factors << i
    end
  end

  all_factors
end

def mutual_factors(*numbers)
  mutual = factors(numbers[0])

  numbers[1..-1].each do |num|
    mutual &= factors(num)
  end

  mutual
end

def tribonacci_number(number)
  return 1 if number == 1 || number == 2
  return 2 if number == 3

  return 1 if number == 1

  return tribonacci_number(number-1) + tribonacci_number(number-2) + tribonacci_number(number-3)
end