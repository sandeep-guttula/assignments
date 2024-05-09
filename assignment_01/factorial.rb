=begin
    Write a Program to find the Factorial of a given number
    Input: 5
    Output: 120
    Explanation: 5! = 5*4*3*2*1 =120
=end

def factorial(n)
    if n == 0
        return 1
    end
    return n * factorial(n-1)
end

# get the number from the user
print "Enter the number: "
n = gets.chomp.to_i
puts factorial(n)