def some?(array, &blk)
  array.each do |ele|
    if (blk.call(ele))
      return true
    end
  end

  false
end

def exactly?(array, number, &prc)
  count = 0

  array.each do |ele|
    if (prc.call(ele))
      count += 1
    end
  end

  count == number
end

def filter_out(array, &blk)
  filtered = []
  array.each do |ele|
    if (!blk.call(ele))
      filtered << ele
    end
  end
  filtered
end

def at_least?(array, number, &prc)
  count = 0

  array.each do |ele|
    count +=1 if prc.call(ele)
  end

  count >= number
end

def every?(array, &prc)
  array.each do |ele|
    if (!prc.call(ele))
      return false
    end
  end

  true
end

def at_most?(array, number, &prc)
  count = 0

  array.each do |ele|
    count += 1 if (prc.call(ele))
  end

  count <= number
end

def first_index(array, &prc)
  array.each do |ele|
    return array.index(ele) if (prc.call(ele))
  end

  nil
end