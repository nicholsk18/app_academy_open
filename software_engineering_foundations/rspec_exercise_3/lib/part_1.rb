def is_prime?(num)
  return false if num < 2

  (2...num).each do |i|
    if num % i == 0
      return false
    end
  end

  true
end

def nth_prime(num)
  prime_counter = 0
  count = 2

  while (true)
    if (is_prime?(count))
      prime_counter += 1
    end

    return count if prime_counter == num
    count += 1
  end
end

def prime_range(min, max)
  prime_arr = []

  (min..max).each do |num|
    if is_prime?(num)
      prime_arr << num
    end
  end

  prime_arr
end