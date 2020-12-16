def duos(string)
  count = 0
  (0...string.length-1).each do |i|
    if string[i] == string[i+1]
      count += 1
    end
  end

  count
end

def sentence_swap(sentence, hash)
  str = []
  sentence.split.each do |word|
    if hash.has_key?(word)
      str << hash[word]
    else
      str << word
    end
  end

  str.join(' ')
end

def hash_mapped(hash, prc, &blk)
  new_hash = {}

  hash.each do |key, val|
    new_key = blk.call(key)
    new_val = prc.call(val)
    new_hash[new_key] = new_val
  end

  new_hash
end

def counted_characters(string)
  hash = Hash.new(0)
  string.each_char do |char|
    hash[char] += 1
  end

  hash.select { |key, val| val > 2 }.keys
end

def triplet_true?(string)
  (0...string.length-1).each do |index|
    if string[index..index+2] == string[index] * 3
      return true
    end
  end

  false
end

def energetic_encoding(string, hash)
  new_str = ""
  string.each_char do |char|
    if char == ' '
      new_str += ' '
    elsif hash.has_key?(char)
      new_str += hash[char]
    else
      new_str += '?'
    end
  end

  new_str
end

def uncompress(string)
  new_str = ''
  (0...string.length-1).each do |i|
    new_str += string[i] * string[i+1].to_i
  end
  new_str
end