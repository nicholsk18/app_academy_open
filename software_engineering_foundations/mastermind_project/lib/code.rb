class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  attr_reader :pegs

  def self.valid_pegs?(chars)
    chars.all? { |char| POSSIBLE_PEGS.has_key?(char.upcase) }
  end

  def self.random(length)
    random_pegs = []
    # get random peg from POSSIBLE_PEGS
    length.times { random_pegs << POSSIBLE_PEGS.keys.sample }
    Code.new(random_pegs)
  end

  def self.from_string(string)
    Code::new(string.split(""))
  end

  def initialize(chars)
    if Code::valid_pegs?(chars)
      @pegs = chars.map(&:upcase)
    else
      raise "pegs are invalid"
    end
  end

  def [](index)
    @pegs[index]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(guess)
    counter = 0

    guess.pegs.each.with_index do |peg, index|
      if peg == @pegs[index]
        counter += 1
      end
    end

    counter
  end

  def num_near_matches(guess)
    counter = 0

    guess.pegs.each.with_index do |peg, index|
      if @pegs.include?(peg) && peg != @pegs[index]
        counter += 1
      end
    end

    counter
  end

  def ==(new_peg)
    self.pegs == new_peg.pegs
  end

end
