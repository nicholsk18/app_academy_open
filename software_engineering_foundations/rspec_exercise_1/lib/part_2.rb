def hipsterfy(word)
  vowels = "aeiou"
  reversed_word = word.reverse
  found = false

  hipsterfy_word = reversed_word.split("").map do |char|
    if !found && vowels.include?(char)
      found = true
      ""
    else
      char
    end
  end

  hipsterfy_word.join("").reverse
end

def vowel_counts(str)
  lowered_split_chars = str.downcase.split("")
  vowels = "aeiou"
  hash = Hash.new(0)
  lowered_split_chars.each do |char|
    if vowels.include?(char)
      hash[char] += 1
    end
  end

  hash
end

def caesar_cipher(message, n)

  char_arr = []

  message.each_byte do |char|
    if char > 96 && char < 123
      index = (char - 97) + n
      char_arr << (index % 26 + 97).chr
    else
      char_arr << char.chr
    end
  end

  char_arr.join("")
end