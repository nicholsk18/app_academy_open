class HumanPlayer
  attr_reader :user_mark

  def initialize(mark_value)
    @user_mark = mark_value
  end

  def get_position
    puts "Player " + @user_mark.to_s + " enter a position as row and col"
    position = *gets.chomp.split(" ")
    if position.length != 2
      return raise "position must only take in a row and column"
    end

    position.map do |num|
      if num.to_i == 0
        raise "position must take an integer"
      else
        num.to_i
      end
    end
  end
end