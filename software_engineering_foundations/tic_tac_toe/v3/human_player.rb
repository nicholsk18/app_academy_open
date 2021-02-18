class HumanPlayer
  attr_reader :mark
  def initialize(mark_value)
    @mark = mark_value
  end

  def valid_position?(position, legal_positions)
    legal_positions.any?(position)
  end

  def get_position(legal_positions)
    is_valid = false
    while !is_valid
      puts "Player " + @mark.to_s + " enter two numbers representing a position in the format 'row col'"
      position = gets.chomp.split(" ").map(&:to_i)
      is_valid = valid_position?(position, legal_positions)
    end

    position
  end
end