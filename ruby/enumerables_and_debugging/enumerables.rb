class Array
  def my_each(&prc)
    self.length.times do |i|
      prc.call(self[i])
    end

    self
  end

  def my_select(&prc)
    new_arr = []
    self.my_each do |item|
      new_arr << item if prc.call(item)
    end

    new_arr
  end

  def my_reject(&prc)
    rejected = []
    self.my_each do |item|
      rejected << item if !prc.call(item)
    end

    rejected
  end

  def my_any?(&prc)
    self.my_each do |item|
      return true if prc.call(item)
    end

    false
  end

  def my_all?(&prc)
    self.my_each do |item|
      return false if !prc.call(item)
    end

    true
  end

  def my_flatten
    flat = []

    self.my_each do |item|
      if item.kind_of?(Array)
        flat.concat(item.my_flatten)
      else
        flat << item
      end
    end

    flat
  end

  def my_zip(*args)
    zipped = []
    (0...self.length).each do |index|
      temp = [self[index]]
      (0...args.length).each do |args_index|
        temp << args[args_index][index]
      end
      zipped << temp
    end
    p zipped
  end

  def my_rotate(by = 1)
    if by > self.length
      by = by % self.length
    end

    self[by...self.length] + self[0...by]
  end

  def my_join(with = "")
    str = ''

    self.length.times do |i|
      str += self[i]
      str += with unless self[i] == self[-1]
    end

    str
  end

  def my_reverse
    reversed = []
    self.my_each do |item|
      reversed = [item] + reversed
    end
    reversed
  end
end