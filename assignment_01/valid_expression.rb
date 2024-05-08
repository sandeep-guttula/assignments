def valid_expression(str)
    stack = []
    symbols = ["*", "/", "+", "-","%","^"]
    n = str.length
    for i in 0...n do
        
        if str[i] == '(' || str[i] == '{' || str[i] == '['
            stack.push(str[i])
        
        else
            if stack.empty?
                puts "Invalid Expression"
                return
            end
            if str[i] == ')' && stack[-1] == '('
                stack.pop
            elsif str[i] == '}' && stack[-1] == '{'
                stack.pop
            elsif str[i] == ']' && stack[-1] == '['
                stack.pop
            else
                puts "Invalid Expression"
                return
            end
        end
    end
    if stack.empty?
        puts "Valid Expression"
    else
        puts "Invalid Expression"
    end

end

valid_expression("]")