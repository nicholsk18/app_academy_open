def reverser(string, &prc)
    prc.call(string.reverse)
end

def word_changer(string, &prc)
    words = string.split
    new_words = words.map { |word| prc.call(word) }
    new_words.join(" ")
end

def greater_proc_value(number, prc_1, prc_2)
    prc_1_val = prc_1.call(number)
    prc_2_val = prc_2.call(number)

    if prc_1_val > prc_2_val
        prc_1_val
    else
        prc_2_val
    end
end

def and_selector (array, prc_1, prc_2)
    selected = []

    array.each do |ele|
        if prc_1.call(ele) && prc_2.call(ele)
            selected << ele
        end
    end
    
    selected
end

def alternating_mapper(array, prc_1, prc_2)
    array.map.with_index do |ele, index|
        if index % 2 == 0
            prc_1.call(ele)
        else
            prc_2.call(ele)
        end
    end
end