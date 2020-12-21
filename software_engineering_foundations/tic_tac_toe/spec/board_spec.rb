require "board"

describe "Board" do
  let(:board) { Board.new }

  it "class should be defined" do
    expect(Object.const_defined?("Board")).to eq(true)
  end

  describe "#initialize" do
    it "should not raise error" do
      expect { board }.to_not raise_error
    end

    it "should set @grid with array" do
      expect(board.instance_variable_get(:@grid)).to match_array(Array.new(3) { Array.new(3, '_') })
    end
  end

  describe "#valid?" do
    it "should accept a position (array) as an arg" do
      expect { board.valid?([0, 0]) }.to_not raise_error
    end

    context "when specified position is valid for the board" do
      it "should return true" do
        position_1 = [0, 0]
        position_2 = [1, 2]

        expect(board.valid?(position_1)).to eq(true)
        expect(board.valid?(position_2)).to eq(true)
      end
    end

    context "when specified position is out of bounds" do
      it "should return false" do
        position_1 = [3, 3]
        position_2 = [1, 4]

        expect(board.valid?(position_1)).to eq(false)
        expect(board.valid?(position_2)).to eq(false)
      end
    end
  end
  #
  describe "#empty?" do
    it "should accept a position (array) as an arg" do
      expect { board.empty?([0, 0]) }.to_not raise_error
    end

    context "when the specified position contains a player's mark" do
      it "should return false" do
        board.instance_variable_set(:@grid, [['_', '_', '_'], ['_', :O, :X], ['_', :O, :X]])

        expect(board.empty?([1, 1])).to eq(false)
        # expect(board.empty?([1, 2])).to eq(false)
        # expect(board.empty?([2, 2])).to eq(false)
      end
    end

    context "when the specified position does not contains a player's mark" do
      it 'should return true' do
        board.instance_variable_set(:@grid, [['_', '_', '_'], ['_', :O, :X], ['_', :O, :X]])

        expect(board.empty?([0, 0])).to eq(true)
        expect(board.empty?([0, 1])).to eq(true)
        expect(board.empty?([0, 2])).to eq(true)
      end
    end
  end
  #
  # describe "#place_mark(position, mark)" do
  #   it "should accept a position and a mark as an arg" do
  #     mark = :X
  #     position = [0, 0]
  #
  #     expect { board.place_mark(position, mark) }.to_not raise_error
  #   end
  #
  #   context "" do
  #     it "" do
  #       expect
  #       board.instance_variable_set(:grid, [['_', '_', '_'], ['_', :O, :X], ['_', :O, :X]])
  #     end
  #   end
  #
  #   context "" do
  #     it "" do
  #       board.instance_variable_set(:grid, [['_', '_', '_'], ['_', :O, :X], ['_', :O, :X]])
  #     end
  #   end
  # end
end