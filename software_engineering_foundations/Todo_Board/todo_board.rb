require_relative 'list.rb'

class TodoBoard
  def initialize
    @lists = {}
  end

  def get_command
    print "\nEnter a command: "
    cmd, list,  *args = gets.chomp.split(' ')

    case cmd
    when "mklist"
      @lists[list] = List.new(list)
    when "ls"
      @lists.keys.each { |list_label| puts ' ' + list_label }
    when "showall"
      @lists.each_value(&:print)
    when 'mktodo'
      # <title>, <deadline>, <optional description>
      @lists[list].add_item(*args)
    when "up"
      @lists[list].up(*args.map(&:to_i))
    when "down"
      @lists[list].down(*args.map(&:to_i))
    when "swap"
      @lists[list].swap(*args.map(&:to_i))
    when "sort"
      @lists[list].sort_by_date!
    when "toggle"
      @lists[list].toggle_item(args[0].to_i)
    when "priority"
      @lists[list].priority
    when "rm"
      @lists[list].remove_item(args[0].to_i)
    when "purge"
      @lists[list].purge
    when 'print'
      if args.empty?
        @lists[list].print
      else
        @lists[list].print_full_item(args[0].to_i)
      end
    when 'quit'
      return false
    else
      print "Sorry, that command is not recognized."
    end

    true
  end

  def run
    while true
      return false if !self.get_command
    end
  end
end

TodoBoard.new.run