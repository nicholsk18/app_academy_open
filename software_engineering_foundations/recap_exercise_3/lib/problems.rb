
def no_dupes?(array)
  hash = Hash.new(0)
  array.each { |ele| hash[ele] += 1 }

  hash.keys.select { |ele| hash[ele] == 1 }
end

def no_consecutive_repeats?(arr)
  (0...arr.length-1).each do |index|
    return false if arr[index] == arr[index+1]
  end

  true
end

def char_indices(str)
  indices = Hash.new { |hash, key| hash[key] = Array.new }

  str.each_char.with_index do |char, index|
    indices[char] << index
  end

  indices
end

def longest_streak(str)
  return str[-1] if no_consecutive_repeats?(str.split(""))

  count = Hash.new(0)
  str.each_char { |char| count[char] += 1 }

  reversed = Hash[count.to_a.reverse] # reveresed to make shure we get the last element.
  longest = reversed.max_by{|k,v| v}
  longest[0] * longest[1]
end

def bi_prime?(num)

end

def vigenere_cipher(message, key)

end

def vowel_rotate(str)

end

class String
  def select(&prc)

  end

  def map!(&prc)

  end
end

def multiply(a, b)

end

def lucas_sequence(num)

end

def prime_factorization(num)

end

