class ComputerPlayer
  attr_reader :mark
  def initialize(mark_value)
    @mark = mark_value
  end

  def get_position(legal_positions)
    computer_choice = legal_positions.sample
    puts "Computer #{self.mark} chose position #{computer_choice.to_s}"
    computer_choice
  end
end