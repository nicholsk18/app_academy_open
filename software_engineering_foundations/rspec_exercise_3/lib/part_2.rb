def element_count(arr)
  hash = Hash.new(0)

  arr.each do |ele|
    hash[ele] += 1
  end

  hash
end

def char_replace!(str, hash)
  str.each_char.with_index do |char, index|
    if hash.key?(char)
      str[index] = hash[char]
    end
  end

  str
end

def product_inject(arr)
  arr.inject { |sum , num| sum * num }
end