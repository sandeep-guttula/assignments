=begin
    Write a Program to find the Mean of an Array:
    Input: 1, 2, 3, 4, 5
    Output: 3
    Explanation: Mean = (1+2+3+4+5) / 5 = 15/5 = 3
=end

def array_mean(arr)
    if arr.length == 0
        return 0
    end
    sum = arr[0] + array_mean(arr[1..arr.length])
end

# get the size of array from the user
puts "Enter the size of array"
n = gets.chomp.to_i

arr = []

# get the array elements from the user
for i in 0...n do
    print "Enter the array element #{i+1}: "
    ele = gets.chomp.to_i
    arr.push(ele)
    puts
end

puts "The mean of array is #{array_mean(arr) / arr.length}"