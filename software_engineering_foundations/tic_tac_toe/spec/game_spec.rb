require "game"
require "human_player"
require "board"

describe "Game" do
  let(:player_1) { HumanPlayer.new(:X) }
  let(:player_2) { HumanPlayer.new(:O) }
  let(:game) { Game.new(:X, :O) }

  it "should have class Game defined" do
    expect(Object.const_defined?("Game")).to eq(true)
  end

  describe "#initialize" do
    it "should accept a mark for player one and mark for player two" do
      expect { game }.to_not raise_error
    end

    it "should set @player_1 and @player_2 with a new player instance" do
      expect(game.instance_variable_get(:@player_1)).to be_instance_of(HumanPlayer)
      expect(game.instance_variable_get(:@player_2)).to be_instance_of(HumanPlayer)
    end

    it "should set @board to a new instance of Board" do
      expect(game.instance_variable_get(:@board)).to be_instance_of(Board)
    end
  end

  describe "#switch_turn" do
    it "should not raise error" do
      expect { game.switch_turn }.to_not raise_error
    end

    it "should change the @current_player everytime its called" do
      player_1 = game.instance_variable_get(:@player_1)
      player_2 = game.instance_variable_get(:@player_2)

      game.switch_turn
      expect(game.instance_variable_get(:@current_player)).to eq(player_2)

      game.switch_turn
      expect(game.instance_variable_get(:@current_player)).to eq(player_1)

      game.switch_turn
      expect(game.instance_variable_get(:@current_player)).to eq(player_2)
    end
  end
end