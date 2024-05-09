=begin
    Write a Program to find the length of the longest sub-array in an array with a sum equal to 0. Error should be thrown if the same is not possible. Please take Max Array Length to be 25
    Input: 15, -2, 2, -8, 1, 7, 10, 23
    Output: 5
    Explanation: The longest sub-array with elements summing up-to 0 is [-2, 2, -8, 1, 7]
=end

def longest_sub_array(arr)
    n = arr.length
    max_length = 0
    for i in 0...n do
        sum = 0
        for j in i...n do
            sum += arr[j]
            if sum == 0
                max_length = [max_length, j-i+1].max
            end
        end
    end
    if max_length == 0
        puts "No sub-array found"
    else
        puts max_length
    end
end

print "Enter the elements of the array: "
arr = gets.chomp.split(' ').map(&:to_i)

longest_sub_array(arr)
  