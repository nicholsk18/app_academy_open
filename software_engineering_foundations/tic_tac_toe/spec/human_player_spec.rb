require "human_player"

describe "HumanPlayer" do
  let(:human_player) { HumanPlayer.new(:X) }

  it "class should be defined" do
    expect(Object.const_defined?("HumanPlayer")).to eq(true)
  end

  describe "#initialize" do
    it "should not raise an error" do
      expect { human_player }.to_not raise_error
    end

    it "should set @user_mark with a mark" do
      expect(human_player.instance_variable_get(:@mark)).to eq(:X)
    end
  end

  describe "#get_position" do
    it "should return input in a position format" do
      position_1 = "1 1 "
      position_2 = " 1 1 "

      allow(human_player).to receive(:gets).and_return(position_1)
      expect(human_player.get_position).to eq([1, 1])

      allow(human_player).to receive(:gets).and_return(position_2)
      expect(human_player.get_position).to eq([1, 1])
    end

    it "should raise error if youing wrong format" do
      position_1 = "1 1 1"
      position_2 = "1"
      position_3 = "one, two"

      allow(human_player).to receive(:gets).and_return(position_1)
      expect { human_player.get_position }.to raise_error

      allow(human_player).to receive(:gets).and_return(position_2)
      expect { human_player.get_position }.to raise_error

      allow(human_player).to receive(:gets).and_return(position_3)
      expect { human_player.get_position }.to raise_error
    end
  end
end