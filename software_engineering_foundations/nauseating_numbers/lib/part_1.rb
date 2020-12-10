def strange_sums(array)
  return 0 if array.length < 2

  count = 0

  (0...array.length).each do |i|
    (i+1...array.length).each do |j|
      if (array[i] + array[j] == 0)
        count += 1
      end
    end
  end

  count
end

def pair_product(array, product)

  (0...array.length).each do |i|
    (i+1...array.length).each do |j|
      if (array[i] * array[j] == product)
        return true
      end
    end
  end

  false
end

def rampant_repeats(string, hash)
  new_str = ""

  string.split("").each do |char|
    if (hash.has_key?(char))
      repeats = char * hash[char]
      new_str += repeats
    else
      new_str += char
    end
  end

  new_str
end

def perfect_square?(number)
  sqr = Math.sqrt(number)

  if (sqr * sqr == number)
    true
  else
    false
  end
end