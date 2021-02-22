require_relative 'item'

class List
  # print styles
  LINE_WIDTH = 52
  LABEL_PADDING = " " * 16
  INDEX_COL_WIDTH = 5
  ITEM_COL_WIDTH = 20
  DEADLINE_COL_WIDTH = 10
  DESCRIPTION_COL_WIDTH = 20
  LINE_WIDTH_FULL = LINE_WIDTH + 15
  CHECKMARK = "\u2713".force_encoding('utf-8') # pretty checkmark
  XMARK = "\u2715".force_encoding('utf-8') # pretty x mark

  attr_accessor :label

  def initialize(label)
    @label = label
    @items = []
  end

  def add_item(title, deadline, description='')
    return false if !Item.valid_date?(deadline)
    @items << Item.new(title, deadline, description)
    true
  end

  def size
    @items.length
  end

  def valid_index?(index)
    (0...self.size).include?(index)
  end

  def swap(index_1, index_2)
    return false if (!self.valid_index?(index_1) || !self .valid_index?(index_2))
    @items[index_1], @items[index_2] = @items[index_2], @items[index_1]
    true
  end

  def [](index)
    return nil if !self.valid_index?(index)

    @items[index]
  end

  def priority
    @items[0]
  end

  def done?(bool)
    bool ? CHECKMARK : XMARK
  end

  def print
    puts '-' * LINE_WIDTH
    puts LABEL_PADDING + self.label.upcase
    puts '-' * LINE_WIDTH

    puts "#{'Index'.ljust(INDEX_COL_WIDTH)} | #{'Item'.ljust(ITEM_COL_WIDTH)} | #{'Deadline'.ljust(DEADLINE_COL_WIDTH)} | #{'Done'.ljust(DEADLINE_COL_WIDTH)}"
    puts "-" * LINE_WIDTH
    @items.each_with_index do |item, i|
      done = done?(item.done)
      puts "#{i.to_s.ljust(INDEX_COL_WIDTH)} | #{item.title.ljust(ITEM_COL_WIDTH)} | #{item.deadline.ljust(DEADLINE_COL_WIDTH)} | #{done}"
    end
    puts "-" * LINE_WIDTH
  end

  def print_full_item(index)
    return nil if !self.valid_index?(index)
    item = self[index]
    puts '-' * LINE_WIDTH_FULL
    puts "#{'Title'.ljust(ITEM_COL_WIDTH)} | #{'Deadline'.ljust(DEADLINE_COL_WIDTH)} | #{'Description'.ljust(DESCRIPTION_COL_WIDTH)} | #{'Done'.ljust(DEADLINE_COL_WIDTH)}"
    puts '-' * LINE_WIDTH_FULL
    puts "#{item.title.ljust(ITEM_COL_WIDTH)} | #{item.deadline.ljust(DEADLINE_COL_WIDTH)} | #{item.description.ljust(DESCRIPTION_COL_WIDTH)} | #{done?(item.done)}"
    puts '-' * LINE_WIDTH_FULL
  end

  def print_priority
    self.print_full_item(0)
  end

  def up(index, amount = 1)
    return false if !self.valid_index?(index)

    while (amount > 0 && index != 0)
      self.swap(index, index-1)
      index -= 1
      amount -= 1
    end
    true
  end

  def down(index, amount = 1)
    return false if !self.valid_index?(index)

    while (amount > 0 && index < self.size)
      self.swap(index, index+1)
      amount -= 1
      index += 1
    end
    true
  end

  def sort_by_date!
    @items.sort_by! { |item| item.deadline }
  end

  def toggle_item(index)
    return if !self.valid_index?(index)

    @items[index].toggle
  end

  def remove_item(index)
    return false if !self.valid_index?(index)
    @items.delete_at(index)
    true
  end

  def purge
    @items = @items.select { |item| !item.done }
  end
end