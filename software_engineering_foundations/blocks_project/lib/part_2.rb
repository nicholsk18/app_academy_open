def all_words_capitalized?(words)
  words.all? { |word| word == word.capitalize}
end

def no_valid_url?(urls)
  # this is the way they did it in the course
  # keep for educational purpose
  #
  # valid_endings = [".com", ".net", ".io", ".org"]
  # urls.none? do |url|
  #   valid_endings.any? { |ending| url.end_with?(ending) }
  # end

  tld = [".com", ".net", ".io", ".org"]
  tld.each do |ending|
    return urls.none? { |url| url.end_with?(ending)}
  end
end

def any_passing_students?(students)
  students.any? do |student|
    student[:grades].sum / student[:grades].length >= 75
  end
end