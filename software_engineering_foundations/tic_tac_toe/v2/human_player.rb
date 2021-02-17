class HumanPlayer
  attr_reader :mark
  def initialize(mark_value)
    @mark = mark_value
  end

  def is_numeric?(val)
    begin
      Integer(val)
    rescue
      false
    else
      true
    end
  end

  def valid_input?(position)
    row, col = position
    is_numeric?(row) && is_numeric?(col) && position.length == 2
  end

  def get_position
    puts "Player " + @mark.to_s + " enter two numbers representing a position in the format 'row col'"
    position = gets.chomp.split(" ")
    if valid_input?(position)
      position.map(&:to_i)
    else
      raise 'position must only take in a row and column and must be a number'
    end
  end
end