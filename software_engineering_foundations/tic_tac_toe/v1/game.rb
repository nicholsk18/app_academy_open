require_relative 'human_player'
require_relative 'board'

class Game
  def initialize(player_1_mark, player_2_mark)
    @board = Board.new
    @player_1 = HumanPlayer.new(player_1_mark)
    @player_2 = HumanPlayer.new(player_2_mark)
    @current_player = @player_1
  end

  def switch_turn
    if @current_player == @player_1
      @current_player = @player_2
    else
      @current_player = @player_1
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