# Write a method, adult_in_group?(people), that accepts an array containing people.
# The method should return true if there is at least 1 person with an age of 18 or greater.
# The method should return false otherwise.


# First solution I use one. After looking at solution and doing further invastingating I understand that one will only match it to one case but if there are more than one than it will return false witch is wrong for this problem set

def adult_in_group?(people)
    people.any? { |hash| hash[:age] >= 18 }
end

people_1 = [
    {name: "Jack", age: 17},
    {name: "Jill", age: 21},
    {name: "Alice", age: 22},
    {name: "Bob", age: 16}
]
p adult_in_group?(people_1)    # => true

people_2 = [
    {name: "Jane", age: 12},
    {name: "John", age: 13},
    {name: "Ashley", age: 10},
    {name: "Bill", age: 16}
]
p adult_in_group?(people_2)    # => false
  