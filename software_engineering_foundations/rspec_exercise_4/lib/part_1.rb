def my_reject(arr, &prc)
  arr.select { |ele| ele if (!prc.call(ele)) }
end

def my_one?(array, &prc)
  count = 0

  array.each do |ele|
    if (prc.call(ele))
      count += 1
    end
  end

  if (count == 1)
    true
  else
    false
  end
end

def hash_select(hash, &prc)
  true_hash = Hash.new

  hash.each do |key, val|
    if (prc.call(key, val))
      true_hash[key] = val
    end
  end

  true_hash
end

def xor_select(array, prc_1, prc_2)
  array.select do |ele|
    if (prc_1.call(ele) && !prc_2.call(ele)) || (!prc_1.call(ele) && prc_2.call(ele))
      ele
    end
  end
end

def proc_count(val, prc_arr)
  count = 0

  prc_arr.each do |prc|
    if prc.call(val)
      count += 1
    end
  end

  count
end