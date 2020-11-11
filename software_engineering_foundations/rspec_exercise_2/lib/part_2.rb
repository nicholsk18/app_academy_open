def palindrome?(string)
  reversed = ""
  string.each_char { |char| reversed = char + reversed }

  reversed == string
end

def substrings(string)
  arr = []
  (0...string.length).each do |i|
    (i...string.length).each do |j|
      arr << string[i..j]
    end
  end

  arr
end

def palindrome_substrings(string)
  substrings(string).select do |sub|
    if palindrome?(sub) && sub.length > 1
      sub
    end
  end
end