def proper_factors(num)
  (1...num).select { |i| i if num % i == 0 }
end

def aliquot_sum(num)
  proper_factors(num).sum
end

def perfect_number?(num)
  aliquot_sum(num) == num
end

def ideal_numbers(num)
  count = 1
  ideal = []

  while (ideal.length != num)
    if perfect_number?(count)
      ideal << count
    end

    count += 1
  end

  ideal
end