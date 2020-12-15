def xnor_select(array, prc_1, prc_2)
  array.select do |ele|
    ele if ((prc_1.call(ele) && prc_2.call(ele)) || (!prc_1.call(ele) && !prc_2.call(ele)))
  end
end

def filter_out!(array, &prc)
  array.uniq.each { |ele| array.delete(ele) if prc.call(ele) }
end

def multi_map(array, num = 1, &prc)
  mapped = []
  array.each do |ele|
    num.times { ele = prc.call(ele) }
    mapped << ele
  end
  mapped
end

def proctition(array, &prc)
  temp = []
  proct = []

  array.each do |ele|
    if (prc.call(ele))
      proct << ele
    else
      temp << ele
    end
  end

  proct + temp
end