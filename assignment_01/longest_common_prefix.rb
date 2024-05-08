=begin
    Write a Program to find the longest common prefix in a given set of strings (Take a maximum of 5 strings as Input)
    Input:
    “apple”, “ape”, “april”
    Output: “ap”
=end


def longest_common_prefix(arr)
    n = arr.length

    # if the array is empty
    if n == 0
        return ""
    end

    # if the array has only one string
    if n == 1
        return arr[0]
    end

    arr = arr.sort
    
    # get the first and last strings
    first = arr[0].chars
    last = arr[-1].chars
    puts "#{first}: #{last} "

    temp = []

    # compare the first and last strings
    for i in 0...first.length do
        if first[i] != last[i]
            break
        end
        temp << first[i]
    end  
    
    # join the array of characters to form a string
    return temp.join()
end


# get the number of strings
puts "Enter the number of strings: "
n = gets.chomp.to_i

# array to store the strings
arr = []

# get the strings from the user
for i in 0...n do
    print "Enter the string #{i+1}: "
    str = gets.chomp
    arr.push(str)
    puts
end

puts "The longest common prefix is : #{longest_common_prefix(arr)}"

