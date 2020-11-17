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
end
