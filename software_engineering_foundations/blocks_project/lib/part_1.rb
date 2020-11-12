def select_even_nums(array)
  array.select { |num| num.even? }
end

def reject_puppies(array)
  array.reject { |hash| hash["age"] < 3 }
end

def count_positive_subarrays(array)
  array.count { |subarray| subarray.sum > 0 }
end

def aba_translate(string)
  new_str = ""
  vowels = "aeiou"

  string.each_char do |char|
    if vowels.include?(char)
      new_str += char + "b" + char
    else
      new_str += char
    end
  end

  new_str
end

def aba_array(array)
  array.map { |word| aba_translate(word) }
end