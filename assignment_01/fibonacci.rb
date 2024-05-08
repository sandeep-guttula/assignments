=begin
    Write a Program to find the Nth Fibonacci Number in the Series
    Input: 5
    Output: 3
    Explanation: Fibonacci Series: 0, 1, 1, 2, 3, 5 (3 is the 5th number)
=end

def fib(n)
    if n == 0
        return 0
    end

    if n == 1
        return 1
    end

    return fib(n-1) + fib(n-2)
end

# get the number from the user
print "Enter the number: "
n = gets.chomp.to_i
puts fib(n-1)
