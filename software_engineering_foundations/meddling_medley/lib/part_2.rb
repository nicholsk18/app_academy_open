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

end

def alternating_vowel(sentence)

end

def silly_talk(sentence)

end

def compress(string)

end