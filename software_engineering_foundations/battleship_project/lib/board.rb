class Board
  attr_reader :size

  def initialize(grid_size)
    @grid = Array.new(grid_size) { Array.new(grid_size) {:N} }
    @size = grid_size * grid_size
  end

  def [](position)
    # destruct position array
    row, col = position
    @grid[row][col]
  end

  def []=(position, value)
    # destruct position array
    row, col = position
    @grid[row][col] = value
  end

  def num_ships
    @grid.flatten.count { |ele| ele == :S }
  end

  def attack(position)
    if self[position] == :S
      self[position] = :H
      puts "you sunk my battleship!"
      return true
    else
      self[position] = :X
      return false
    end
  end

  def place_random_ships
    amount_will_place = @size * 0.25

    while self.num_ships < amount_will_place
      random_row = rand(0...@grid.length)
      random_column = rand(0...@grid.length)
      position = [random_row, random_column]
      self[position] = :S
    end
  end

  def hidden_ships_grid
    @grid.map do |row|
      row.map do |col|
        if col == :S
          :N
        else
          col
        end
      end
    end
  end

  def self.print_grid(grid)
    grid.each do |row|
      puts row.join(" ")
    end
  end

  def cheat
    Board::print_grid(@grid)
  end

  def print
    Board::print_grid(self.hidden_ships_grid)
  end
end
