def partition(arr, num)
  sub_1 = []
  sub_2 = []

  arr.each do |ele|
    if ele < num
      sub_1 << ele
    else
      sub_2 << ele
    end
  end

  [sub_1, sub_2]
end


def merge(hash_1, hash_2)
  main_hash = Hash.new(0)
  hash_1.each { |key, value| main_hash[key] = value }
  hash_2.each { |key, value| main_hash[key] = value }

  main_hash
end


def censor(str, arr)
  parts = []

  str.split.each do |word|
    if arr.include?(word.downcase)
      parts << censor_vowel(word)
    else
      parts << word
    end
  end

  parts.join(" ")
end

def censor_vowel(word)
  vowels = "aeiouAEIOU"
  new_word = ""

  word.each_char do |char|
    if vowels.include?(char)
      new_word += "*"
    else
      new_word += char
    end
  end

  new_word
end

def power_of_two?(num)
  return true if num == 1

  (1...num).each do |n|
    if 2.pow(n) == num
      return true
    end
  end

  return false
end