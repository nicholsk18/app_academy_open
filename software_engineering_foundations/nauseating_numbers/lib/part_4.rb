def is_prime?(num)
  return  false if num < 2
  (2...num).none? { |i| num % i == 0 }
end

def mersenne_prime(number)
  exp = -1
  count = 0

  while count < number
    exp += 1
    mersenne = 2 ** exp - 1
    count += 1 if is_prime?(mersenne)
  end
  2 ** exp - 1
end

def triangular_word?(word)

end

def consecutive_collapse(array)

end

def pretentious_primes(array, number)

end