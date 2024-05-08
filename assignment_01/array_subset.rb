=begin
    Write a Program to take two arrays as input and check if one is a subset of the other
    Case #1: Positive Scenario
    Input:
    Array #1: 1, 2, 3, 4
    Array #2: 1, 2
    Output: Array #2 is a subset of Array #1
    Case #2: Negative Scenario
    Input:
    Array #1: 1, 2, 3, 4
    Array #2: 8, 6, 6
    Output: Array #2 is not subset of Array #1
=end

def array_subset(arr1, arr2)

    # check if length of arr1 is less than arr2
    if arr1.length < arr2.length
        return false
    end

    # check if all elements of arr2 are present in arr1
    arr2.each do |ele|
        if !arr1.include?(ele)
            return false
        end
    end

    return true
end



#  get the size of array 1 from the user
print "Enter the size of array 1 : "
n = gets.chomp.to_i
arr1 = []
puts
for i in 0...n do
    print "Enter the array 1 element #{i+1}: "
    ele = gets.chomp.to_i
    arr1.push(ele)
    puts
end


# get the size of array 2 from the user
print "Enter the size of array 2 : "
m = gets.chomp.to_i
arr2 = []
puts
for i in 0...m do
    print "Enter the array 2 element #{i+1}: "
    ele = gets.chomp.to_i
    arr2.push(ele)
    puts
end


# check if array 2 is a subset of array 1
if array_subset(arr1, arr2)
    puts "Array 2 is a subset of Array 1"
else
    puts "Array 2 is not a subset of Array 1"
end

