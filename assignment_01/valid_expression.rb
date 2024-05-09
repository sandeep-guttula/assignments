=begin
    Write a Program to check and return if an expression is valid or not. We should check for the following:
    The expression should not contain anything other than numbers and mathematical symbols (No alphabets)
    Allowed Operations: + (Add), - (Subtract), * (Multiply), / (Divide), % (Mod), ^ (Exponent)
    Check if all brackets have been closed
    Case #1: Valid Expression
    Input: (5+4)*[(4/5)-{9-6+(10^2)}]
    Output: Valid
    Case #2: Invalid Expression
    Input: (5+4*[(4/5)-{9-6+(10^2}
    Output: Invalid
    Explanation: Brackets have not been closed properly
=end
  
def valid_expression(expression)

    stack = []

    # checking if the expression contains alphabets or special characters
    alphabetsAndSpecialChars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ!@#$&_=,.<>?;:"

    expression.each_char do |char|
        if alphabetsAndSpecialChars.include?(char)
            return false
        end
    end
  
    # possible pairs of brackets
    pairs = { ')' => '(', ']' => '[', '}' => '{' }
  
    expression.each_char do |char|
        if char == '(' || char == '{' || char == '['
            stack.push(char)
        elsif char == ')' || char == '}' || char == ']'
            if stack.empty? || stack.last != pairs[char]
              return false
            else
              stack.pop
            end
        end
    end

    return stack.empty?
  end
  

# get the expression from the user
print "Enter the expression: "
case1_input = gets.chomp
  
result = valid_expression(case1_input) ? "Valid" : "Invalid"

puts result
  

# def valid_expression(str)
#     stack = []
#     symbols = ["*", "/", "+", "-","%","^"]
#     n = str.length
#     for i in 0...n do
        
#         if str[i] == '(' || str[i] == '{' || str[i] == '['
#             stack.push(str[i])
        
#         else
#             if stack.empty?
#                 puts "Invalid Expression"
#                 return
#             end
#             if str[i] == ')' && stack[-1] == '('
#                 stack.pop
#             elsif str[i] == '}' && stack[-1] == '{'
#                 stack.pop
#             elsif str[i] == ']' && stack[-1] == '['
#                 stack.pop
#             else
#                 puts "Invalid Expression"
#                 return
#             end
#         end
#     end
#     if stack.empty?
#         puts "Valid Expression"
#     else
#         puts "Invalid Expression"
#     end

# end

# valid_expression("]")



# def valid_expression(expression)
#     begin
#       eval(expression)
#       return true
#     rescue SyntaxError, StandardError
#       return false
#     end
# end