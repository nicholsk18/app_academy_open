def my_map(array, &prc)
    new_arr = []

    array.each { |ele| new_arr << prc.call(ele) }

    new_arr
end

def my_select(array, &prc)
    selected_ele = []

    array.each { |ele| selected_ele << ele if prc.call(ele) }

    selected_ele
end

def my_count(array, &prc)
    count = 0

    array.each { |ele| count +=1 if prc.call(ele) }

    count
end

def my_any?(array, &prc)
    array.each { |ele| return true if prc.call(ele) }

    false
end

def my_all?(array, &prc)
    array.each { |ele| return false if !prc.call(ele) }

    true
end

def my_none?(array, &prc)
    array.each { |ele| return true if !prc.call(ele) }

    false

end