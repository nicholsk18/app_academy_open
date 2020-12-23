class HumanPlayer
  attr_reader :mark

  def initialize(mark_value)
    @mark = mark_value
  end

  def get_position
    puts "Player " + @mark.to_s + " enter a position as row and col"
    position = *gets.chomp.split(" ")
    if position.length != 2
      return raise "position must only take in a row and column"
    end

    position.map do |num|
      # need to add error checking
      num.to_i
    end
  end
end