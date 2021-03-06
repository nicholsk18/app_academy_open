
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

def prime?(num)
  return false if num < 2

  (2...num).none? { |i| num % i == 0}
end

def bi_prime?(num)

 (1..num).each do |index|
  if (num % index == 0)
    if (prime?(index) && prime?(num / index))
      return true
    end
  end
 end

 false
end

def vigenere_cipher(message, key)
  char_arr = []

  message.each_byte.with_index do |char, i|

    if char > 96 && char < 123
      index = (char - 97) + key[i % key.length]
      char_arr << (index % 26 + 97).chr
    else
      char_arr << char.chr
    end
  end

  char_arr.join("")
end

def vowel_rotate(str)
  vowels = 'aeiou'
  str = str.reverse

  str.each_char.with_index do |char, index|
    if (vowels.include?(char))
      (index+1...str.length).each do |j|
        if (vowels.include?(str[j]))
          str[index], str[j] = str[j], str[index]
          break
        end
      end
    end
  end

  str.reverse
end

class String
  def select(&prc)
    prc = prc || Proc.new { |char| false }
    str = ""

    self.each_char do |char|
      if (prc.call(char))
        str += char
      end
    end

    str
  end

  def map!(&prc)
    (0...self.length).each do |i|
      self[i] = prc.call(self[i], i)
    end

    self
  end
end

def multiply(a, b)
  return 0 if ( b == 0)
  if (b < 0)
    -(a + multiply(a, (-b) - 1))
  else
    a + multiply(a, b - 1)
  end
end

def lucas_sequence(num)
  return [] if (num == 0)
  return [2] if (num == 1)
  return [2, 1] if (num == 2)

  seq = lucas_sequence(num - 1)
  next_ele = seq[-1] + seq[-2]
  seq << next_ele
  seq
end

def prime_factorization(num)
  (2...num).each do |fact|
    if num % fact == 0
      other_fact = num / fact
      return [*prime_factorization(fact), *prime_factorization(other_fact)]
    end
  end

  [ num ]
end

p prime_factorization(12)

