def zip(*arrays)
  zipped = []

  (0...arrays[0].length).each do |index|
    temp = []
    arrays.each do |array|
      temp << array[index]
    end

    zipped << temp
  end

  zipped
end

def prizz_proc(array, prc_1, prc_2)
  array.select do |ele|
    if ((prc_1.call(ele) && !prc_2.call(ele)) || (!prc_1.call(ele) && prc_2.call(ele)))
      ele
    end
  end
end

def zany_zip(*arrays)
  longest = arrays.length

  arrays = arrays.map do |array|
    while (array.length <= longest)
      array << nil
    end

    array
  end

  zip(*arrays)
end

def maximum(array, &prc)
  max = 0
  big_ele = nil

  array.each do |ele|
    if (prc.call(ele) >= max)
      big_ele = ele
      max = prc.call(ele)
    end
  end

  big_ele
end

def my_group_by(array, &prc)
  hash = Hash.new() { |hash, key| hash[key] = Array.new() }

  array.each do |ele|
    hash[prc.call(ele)] << ele
  end

  hash
end

def max_tie_breaker(array, tie_breaker, &prc)
  return nil if array.empty?

  max = array.first
  array.each do |ele|
    result_ele = prc.call(ele)
    result_max = prc.call(max)
    if result_ele > result_max
      max = ele
    elsif result_ele == result_max && tie_breaker.call(ele) > tie_breaker.call(max)
      max = ele
    end
  end

  max
end

def change_word(word)
  indices = vowel_indices(word)
  word[indices.first..indices.last]
end

def vowel_indices(word)
  vowels = 'aeiou'
  indices = []
  word.each_char.with_index do |char, i|
    indices << i if vowels.include?(char)
  end
  indices
end

def silly_syllables(sentence)
  words = sentence.split(' ')
  new_words = words.map do |word|
    num_vowels = vowel_indices(word).length
    if num_vowels < 2
      word
    else
      change_word(word)
    end
  end
  new_words.join(' ')
end