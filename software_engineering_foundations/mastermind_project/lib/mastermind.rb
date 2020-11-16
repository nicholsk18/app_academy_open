require_relative "code"

class Mastermind
  def initialize(length)
    @secret_code = Code::random(length)
  end

  def print_matches(code)
    puts @secret_code.num_exact_matches(code)
    puts @secret_code.num_near_matches(code)
  end

  def ask_user_for_guess
    puts "Enter a code"
    user_guess = gets.chomp
    user_code = Code::from_string(user_guess)

    self.print_matches(@secret_code)
    self.print_matches(user_code)

    @secret_code == user_code
  end
end
