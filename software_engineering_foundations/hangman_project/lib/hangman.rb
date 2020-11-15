class Hangman
  DICTIONARY = ["cat", "dog", "bootcamp", "pizza"]
  
  def self.random_word
    DICTIONARY.sample
  end

  def initialize
    @secret_word = Hangman.random_word
    @guess_word = Array.new(@secret_word.length, "_")
    @attempted_chars = []
    @remaining_incorrect_guesses = 5
  end

  def guess_word
    @guess_word
  end

  def attempted_chars
    @attempted_chars
  end

  def remaining_incorrect_guesses
    @remaining_incorrect_guesses
  end

  def already_attempted?(char)
    @attempted_chars.include?(char)
  end

  def get_matching_indices(char)
    matching_indices = []

    @secret_word.each_char.with_index do |secret_char, index|
      if secret_char == char
        matching_indices << index
      end
    end

    matching_indices
  end

  def fill_indices(char, indices)
    indices.each { |index| @guess_word[index] = char }
  end

  def try_guess(char)
    if self.already_attempted?(char)
      p "that has already been attempted"
      return false
    end

    @attempted_chars << char
    self.fill_indices(char, self.get_matching_indices(char))
    
    if self.get_matching_indices(char).empty?
      @remaining_incorrect_guesses -= 1
    end

    true
  end

  def ask_user_for_guess
    p "Enter a char:"
    user_guess = gets.chomp
    
    self.try_guess(user_guess)
  end

  def win?
    if @guess_word == @secret_word.split("")
      p "WIN"
      return true
    end

    false
  end

  def lose?
    if @remaining_incorrect_guesses == 0
      p "LOSE"
      return true
    end

    false
  end

  def game_over?
    if self.win? || self.lose?
      p @secret_word
      return true
    end

    false
  end
end
