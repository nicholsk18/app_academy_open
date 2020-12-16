def selected_map!(array, prc_1, prc_2)
  array.each_with_index do |ele, index|
    array[index] = prc_2.call(ele) if prc_1.call(ele)
  end

  nil
end

def chain_map(number, array_of_prc)
  chained = number

  array_of_prc.each do |prc|
    chained = prc.call(chained)
  end

  chained
end

def proc_suffix(sentence, hashes)
  filled = []
  sentence.split.each do |word|
    temp = word
    hashes.each do |key, val|
      if key.call(word)
        temp += val
      end
    end
    filled << temp
  end

  filled.join(" ")
end

def proctition_platinum(array, *prcs)
  partition = {}
  prcs.each_index { |i| partition[i + 1] = [] }
  array.each do |el|
    prcs.each_with_index do |prc, i|
      if prc.call(el)
        partition[i + 1] << el
        break
      end
    end
  end
  partition
end

def procipher(sentence, hash)
  words = sentence.split(" ")

  procipher_word = words.map do |word|
    new_word = word
    hash.each do |key, val|
      new_word = val.call(new_word) if key.call(word)
    end
    new_word
  end

  procipher_word.join(" ")
end

def picky_procipher(sentence, hash)
  words = sentence.split(" ")

  procipher_word = words.map do |word|
    new_word = word
    hash.each do |key, val|
      if key.call(word)
        new_word = val.call(new_word)
        break
      end
    end
    new_word
  end

  procipher_word.join(" ")
end