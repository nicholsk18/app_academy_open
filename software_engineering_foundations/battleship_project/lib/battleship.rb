require_relative "board"
require_relative "player"

class Battleship
  attr_reader :board, :player

  def initialize(board_length)
    @player = Player::new
    @board = Board::new(board_length)
    @remaining_misses = @board.size / 2
  end

  def start_game
    @board.place_random_ships
    puts "Number of ships: #{@board.num_ships}"
    @board.print
  end

  def lose?
    if @remaining_misses <= 0
      puts "you lose"
      return true
    end

    false
  end

  def win?
    if @board.num_ships > 0
      return false
    end

    puts "you win"
    true
  end

  def game_over?
    self.win? || self.lose?
  end

  def turn
    move = @player.get_move
    if !@board.attack(move)
      @remaining_misses -= 1
    end
    @board.print
    puts "Remaining misses: #{@remaining_misses}"
  end
end
