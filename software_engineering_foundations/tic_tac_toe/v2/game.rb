require_relative 'human_player'
require_relative 'board'

class Game
  attr_reader :players
  def initialize(board_size, *marks)
    @board = Board.new(board_size)
    @players = []
    marks.each do |mark|
      @players << HumanPlayer.new(mark)
    end
    @current_player = @players[0]
  end

  def print_arr
    p arr
  end

  def switch_turn
    player_index = @players.find_index(@current_player)
    if player_index+1 < @players.length
      @current_player = @players[player_index+1]
    else
      @current_player = @players[0]
    end
  end

  def play
    while @board.empty_positions?
      @board.print
      position = @current_player.get_position
      mark = @current_player.mark
      @board.place_mark(position, mark)
      if @board.win?(mark)
        puts "Vicotry! Player " + mark.to_s + " wins"
        return
      else
        self.switch_turn
      end
    end

    puts "Draw"
  end
end