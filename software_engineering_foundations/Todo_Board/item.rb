class Item
  attr_reader :title
  attr_accessor :deadline, :description

  def self.valid_date?(date_string)
    date_parts = date_string.split('-').map(&:to_i)
    year, month, day = date_parts
    return false if date_parts.length != 3
    return false if !month.between?(1,12)
    return false if !day.between?(1,31)

    true
  end

  def initialize(title, deadline, description)
    raise 'Invalid Date' if !Item.valid_date?(deadline)
    @title = title
    @deadline = deadline
    @description = description
  end

  def deadline=(new_deadline)
    raise 'Invalid Date' if !Item.valid_date?(new_deadline)
    @deadline = new_deadline
  end
end