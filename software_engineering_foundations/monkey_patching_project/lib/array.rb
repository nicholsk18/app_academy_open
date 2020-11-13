# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
  def span
    return nil if self.empty?

    self.max - self.min
  end

  def average
    return nil if self.empty?

    self.sum / (self.length * 1.0)
  end

  def median
    return nil if self.empty?

    sorted = self.sort
    half_way = sorted.length / 2

    if self.length.odd?
      return sorted[half_way]
    else
      sum = sorted[half_way-1] + sorted[half_way]
      return sum / 2.0
    end
  end

  def counts
    count = Hash.new(0)

    self.each { |ele| count[ele] += 1 }

    count
  end

  def my_count(element)
    self.counts[element]
  end

  def my_index(element)
    self.each.with_index do |ele, index|
      if ele == element
        return index
      end
    end

    nil
  end

  def my_uniq
    uniq = []
    self.each do |item|
      if !uniq.include?(item)
        uniq << item
      end
    end

    uniq
  end
end
