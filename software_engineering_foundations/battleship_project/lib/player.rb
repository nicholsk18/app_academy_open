class Player
  def get_move
    puts "enter a position with coordinates separated with a space like '4 7'"
    user_points = gets.chomp.split.map { |num| num.to_i }
    user_points
  end
end
