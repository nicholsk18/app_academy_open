# Write a method, compress_str(str), that accepts a string as an arg.
# The method should return a new str where streaks of consecutive characters are compressed.
# For example "aaabbc" is compressed to "3a2bc".

def compress_str(str)
    count = 1
    new_str = ""
  
    (0...str.length).each do |num|
      if str[num] == str[num + 1]
        count += 1
      elsif str[num] != str[num + 1] && count != 1
        new_str += count.to_s + str[num]
        count = 1
      else
        new_str += str[num]
      end
    end
  
    new_str
end

p compress_str("aaabbc")        # => "3a2bc"
p compress_str("xxyyyyzz")      # => "2x4y2z"
p compress_str("qqqqq")         # => "5q"
p compress_str("mississippi")   # => "mi2si2si2pi"