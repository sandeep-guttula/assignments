=begin
    Write a Program to reverse a string via Recursion and via Loop (there should be two separate functions):
    Input: “ABCD”
    Output:
    Reverse via Recursion: “DCBA”
    Reverse via Loops: “DCBA”
    Please do not use any inbuilt functions provided by Ruby here
=end

# With loop
def string_reverse_loop(str)
    rev = ""
    n = str.length-1
    puts n

    # loop through the string in reverse order
    while n >= 0 do
        rev += str[n]
        n -= 1
    end
    return rev
end

# with recursion
def string_reverse_recursion(str)
    if str.length == 0
        return ""
    end

    if str.length == 1
        return str
    end

    # return the last character and call the function with the remaining string
    return str[-1] + string_reverse_recursion(str[0..str.length-2])
end


# get the string from the user
puts "Enter the string: "
str = gets.chomp

puts string_reverse_loop(str)
puts string_reverse_recursion(str)