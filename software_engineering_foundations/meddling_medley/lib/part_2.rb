def conjunct_select(array, *prcs)
  array.select { |ele| prcs.all? { |prc| prc.call(ele) } }
end

def convert(word)
  vowels = 'AEIOUaeiou'
  return word + 'yay' if vowels.include?(word[0])

  (0...word.length).each do |i|
    if vowels.include?(word[i])
      return word[i..-1] + word[0...i] + 'ay'
    end
  end
end

def convert_pig_latin(sentence)
  words = sentence.split(' ')
  new_words = words.map do |word|
    new_word = word.length < 3 ? word : convert(word)
    word == word.capitalize ? new_word.capitalize : new_word
  end

  new_words.join(" ")
end

def repeat_last(word)
  vowerls = 'aeiou'
  return word + word.downcase if vowerls.include?(word[-1])

  i = word.length - 1
  while i >= 0
    return word + word[i..-1] if vowerls.include?(word[i])
    i -= 1
  end
end

def reverberate(sentence)
  words = sentence.split(' ')

  new_words = words.map do |word|
    if word.length < 3
      word
    else
      repeat_last(word)
    end
  end

  new_words.join(' ')
end

def disjunct_select(array, *prcs)
  array.select do |ele|
    ele if prcs.any? { |prc| prc.call(ele)}
  end
end

def first_vowel(word)
  vowels = 'aeiou'

  word.each_char.with_index do |char, index|
    if vowels.include?(char)
      return word[0...index] + word[index+1..-1]
    end
  end
end

def last_vowel(word)
  first_vowel(word.reverse).reverse
end

def alternating_vowel(sentence)
  words = sentence.split

  new_words = words.map.with_index do |word, index|
    if index.even?
      first_vowel(word)
    else
      last_vowel(word)
    end
  end

  new_words.join(" ")
end

def silly_talk(sentence)
  words = sentence.split(' ')
  new_words = words.map do |word|
    new_word = transcribe_word(word)
    word == word.capitalize ? new_word.capitalize : new_word
  end
  new_words.join(' ')
end

def transcribe_word(word)
  vowels = 'AEIOUaeiou'
  return word + word[-1] if vowels.include?(word[-1])
  new_word = ''
  word.each_char do |char|
    if vowels.include?(char)
      new_word += char + 'b' + char
    else
      new_word += char
    end
  end
  return new_word
end

def compress(string)
  compressed = ''
  letters = ('a'..'z').to_a
  i = 0
  while i < string.length
    char = string[i]
    count = 1
    i += 1
    while char == string[i]
      count += 1
      i += 1
    end

    if count > 1
      compressed += char + count.to_s
    else
      compressed += char
    end
  end

  compressed
end