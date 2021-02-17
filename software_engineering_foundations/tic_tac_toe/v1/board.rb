class Board
  def initialize
    @grid = Array.new(3) { Array.new(3, '_') }
  end

  ###################
  # Helper methods
  ###################

  def [](position)
    row, col = position
    @grid[row][col]
  end

  def []=(position, mark)
    row, col = position
    @grid[row][col] = mark
  end

  ###################
  # End Helper methods
  ###################

  def valid?(position)
    position.all? do |i|
      0 <= i && i < @grid.length
    end
  end

  def empty?(position)
    self[position] == '_'
  end

  def place_mark(position, mark)
    raise 'invalid mark' if !valid?(position) || !empty?(position)
    self[position] = mark
  end

  def print
    @grid.each do |row|
      puts row.join(' ')
    end
  end

  def win_row?(mark)
    # go over each row
    # if all match mark return true
    @grid.any? do |row|
      row.all?(mark)
    end
  end

  def win_col?(mark)
    # flip row with col
    # than check to see if that col contains all marks
    @grid.transpose.any? { |col| col.all?(mark) }
  end

  def win_diagonal?(mark)
    left_to_right = []
    right_to_left = []

    (0...@grid.length).each do |index|
      left_to_right << @grid[index][index]
      right_to_left << @grid[index][-1 + (-index)]
    end

    left_to_right.all?(mark) || right_to_left.all?(mark)
  end

  def win?(mark)
    win_row?(mark) || win_col?(mark) || win_diagonal?(mark)
  end

  def empty_positions?
    @grid.flatten.any?('_')
  end
end