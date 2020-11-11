def average(num_1, num_2)
  (num_1 + num_2) / 2.0
end

def average_array(array)
  total = array.inject { |sum, num| sum + num }
  total / array.length.to_f
end

def repeat(str, num)
  str * num
end

def yell(str)
  str.upcase + "!"
end

def alternating_case(str)
  # str.split.map.with_index { |word, i| i % 2 == 0 ? word.upcase : word.downcase }.join(" ")
  words = str.split
  alternating_words = words.map.with_index { |word, i| i % 2 == 0 ? word.upcase : word.downcase }
  alternating_words.join(" ")
end