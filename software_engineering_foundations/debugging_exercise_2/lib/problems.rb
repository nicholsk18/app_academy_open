# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

def largest_prime_factor(num)
  (1..num).to_a.reverse.select do |i|
    if num % i == 0 && prime?(i)
      return i
    end
  end
end

def prime?(num)
  return false if num < 2

  (2...num).none? { |i| num % i == 0}
end

def unique_chars?(string)
  string.each_char.find do |char|
    if string.count(char) > 1
      return false
    end
  end

  true
end

def dupe_indices(array)
  hash = Hash.new { |h, k| h[k] = [] }
  array.each.with_index do |char, i|
    if array.count(char) > 1
      hash[char] += [i]
    end
  end

  hash
end

def ana_array(arr_1, arr_2)
  return false if arr_1.length != arr_2.length

  temp = []
  used_idx = []

  arr_1.each do |ele_1|
    arr_2.each.with_index do |ele_2, i|
      if ele_1 == ele_2 && !(used_idx.include?(i))
        temp << ele_1
        used_idx << i
        break
      end
    end
  end

  temp == arr_1
end