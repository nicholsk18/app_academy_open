require_relative "code"

class Mastermind
  def initialize(length)
    @secret_code = Code::random(length)
  end

  def print_matches(code)
    puts "Exact Matches #{@secret_code.num_exact_matches(code)}"
    puts "Near Matches #{@secret_code.num_near_matches(code)}"
  end

  def ask_user_for_guess
    puts "Enter a code"
    user_guess = Code::from_string(gets.chomp)

    self.print_matches(user_guess)

    @secret_code == user_guess
  end
end
