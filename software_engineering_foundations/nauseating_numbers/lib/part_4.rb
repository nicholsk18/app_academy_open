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

def triangular_seq(num)
  (1..num).each do |i|
    seq = (i * (i + 1)) / 2
    if (seq == num)
      return true
    end
  end

  false
end

def triangular_word?(word)
  alphabet = ('a'..'z').to_a
  index_sum = 0

  word.split('').each do |char|
    index_sum += alphabet.index(char)+1
  end

  triangular_seq(index_sum)
end

def consecutive_collapse(array)
  index = 0
  fully_collapsed = false

  while (!fully_collapsed)
    fully_collapsed = true

    while (index < array.length-1)
      curr_ele = array[index]
      next_ele = array[index + 1]

      if (curr_ele + 1 == next_ele || curr_ele - 1 == next_ele)
        fully_collapsed = false
        array = array[0...index] + array[index+2..-1]
        index = 0
      else
        index += 1
      end
    end
  end

  array
end

def next_prime(num, location)
  count = 0
  prime = 0
  while (count < location)
    num += 1
    if (is_prime?(num))
      count += 1
      prime = num
    end
  end

  prime
end

def previous_prime(num, location)
  count = 0
  prime = 0
  while (count > location)
    num -= 1
    return nil if num < 2

    if (is_prime?(num))
      count -= 1
      prime = num
    end
  end

  prime
end

def pretentious_primes(array, number)
  array.map do |ele|
    if (number > 0)
      next_prime(ele, number)
    else
      previous_prime(ele, number)
    end
  end
end