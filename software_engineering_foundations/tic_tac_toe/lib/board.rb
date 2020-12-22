class Board

  def initialize
    @grid = Array.new(3) { Array.new(3, '_') }
  end

  def valid?(position)
    (position[0] >= 0 && position[0] < 3) && (position[1] >= 0 && position[1] < 3)
  end

  def empty?(position)
    @grid[position[0]][position[1]] == '_'
  end

  def place_mark(position, mark)
    if !self.valid?(position) || !self.empty?(position)
      rasie "Invalid Mark"
    else
      @grid[position[0]][position[1]] = mark
    end
  end

  def print
    @grid.each do |row|
      p row
    end
  end

  def win_row?(mark)
    @grid.each do |row|
      if row.all? { |item| item == mark }
        return true
      end
    end

    false
  end

  def win_col?(mark)
    (0...@grid.length).each do |row|
      column = []
      (0...@grid.length).each do |col|
        column << @grid[col][row]
      end

      return true if column.all? { |ele| ele == mark }
    end

    false
  end

  def win_diagonal?(mark)

  end
end