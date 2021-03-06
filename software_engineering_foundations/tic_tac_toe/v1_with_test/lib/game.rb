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
    is_game_over = false

    while !is_game_over
      mark = @current_player.mark
      
      @board.print

      player_turn = @current_player.get_position

      # attempt to place mark. Will raise error if not valid
      @board.place_mark(player_turn, mark)

      if @board.win?(mark)

        @board.print
        puts "Victory to :" + mark.to_s
        is_game_over = true
      else
        if @board.empty_positions?
          self.switch_turn
        else
          puts "The game is a tie"
          is_game_over = true
        end
      end
    end
  end
end