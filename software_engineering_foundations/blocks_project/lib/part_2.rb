def all_words_capitalized?(array)
  array.all? { |word| word == word.capitalize}
end

def no_valid_url?(array)
  tld = [".com", ".net", ".io", ".org"]
  tld.each do |ending|
    return array.none? { |word| word.end_with?(ending)}
  end
end

def any_passing_students?(students)
  students.any? do |student|
    student[:grades].sum / student[:grades].length >= 75
  end
end