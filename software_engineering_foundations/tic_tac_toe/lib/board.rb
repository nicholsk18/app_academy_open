class Board
  # attr_reader :grid

  def initialize
    @grid = Array.new(3) { Array.new(3, '_') }
  end

  def valid?(position)
    position[0] < 3 && position[1] < 3
  end
end