class Board
  attr_reader :size

  def initialize(grid_size)
    @grid = Array.new(grid_size) {Array.new(grid_size) {:N}}
    @size = grid_size * grid_size
  end

  def [](indices)
    @grid[indices[0]][indices[1]]
  end

  def []=(position, value)
    @grid[position[0]][position[1]] = value
  end

  def num_ships
    counter = 0

    @grid.each do |row|
      row.each do |column|
        if column == :S
          counter += 1
        end
      end
    end

    counter
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
          col = :N
        else
          col
        end
      end
    end
  end

  def self.print_grid(grid)
    grid.each do |row|
      print row.join(" ") + "\n"
    end
  end

  def cheat
    Board::print_grid(@grid)
  end

  def print
    Board::print_grid(self.hidden_ships_grid)
  end
end
