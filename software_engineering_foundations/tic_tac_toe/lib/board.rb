class Board

  def initialize
    @grid = Array.new(3) { Array.new(3, '_') }
  end

  def valid?(position)
    position[0] < 3 && position[1] < 3
  end

  def empty?(position)
    @grid[position[0]][position[1]] == '_'
  end

  def place_mark(position, mark)

  end
end