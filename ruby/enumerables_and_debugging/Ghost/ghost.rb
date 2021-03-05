
class Ghost
  ALPHABET = Set.new('a'..'z')
  LIVES = 5

  def initialize(*players)
    words = File.readlines("dictionary.txt").map(&:chomp)
    @players = players
    @dictionary = Set.new(words)
  end

  def current_player
    @players.first
  end

  def previous_player

  end

  def next_player!

  end

  def take_turn(player)

  end

  def valid_play?(string)

  end

  def play_round

  end
end