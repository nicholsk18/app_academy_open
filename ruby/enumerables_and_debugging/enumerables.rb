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
end