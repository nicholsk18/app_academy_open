require_relative "board"
require_relative "human_player"

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
    p @current_player.get_position
    # is_game_over = false

    # while !is_game_over
    #   mark = @current_player.mark
      
    #   @board.print

    #   player_turn = @current_player.get_position

    #   # attempt to place mark. Will raise error if not valid
    #   @board.place_mark(player_turn, mark)

    #   if @board.win_col?(mark) || @board.win_row?(mark) || @board.win_diagonal?(mark)

    #     @board.print
    #     puts "Victory to :" + mark.to_s
    #     is_game_over = true
    #   else
    #     self.switch_turn
    #   end
    # end
  end
end