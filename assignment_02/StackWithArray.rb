=begin
    Write a Program to Implement Stack with an Array and perform the following operations:
    Push Data
    Pop Data
    Peek Data
=end

class StackArray


    # Initialize the stack with size 
    def initialize(size = 100)
        @size = size
        @stack = Array.new(@size)
        @length = 0
        puts "Stack created with size #{@size}"
    end

    def push(data)
        if @length == @size
            puts "Stack is full"
            return
        end
        @stack[@length] = data
        @length += 1
        printStack
    end

    def pop

        # If the stack is empty return
        if @stack.empty?
            puts "Stack is empty"
            return
        end
        @length -= 1
        popped = @stack[@length]
        @stack[@length] = nil
        printStack
        return popped
    end

    def peek
        if @stack.empty?
            puts "Stack is empty"
            return
        end
        puts "Top element is #{@stack[@length - 1]}"
    end

    def printStack
        puts "\n\n\n--- Stack ---"
        i = @length - 1
        while i >= 0
            puts "| #{@stack[i]} |"
            i -= 1
        end
        puts "-------------"
    end
end

puts "Enter the size of the stack"
size = gets.chomp.to_i
stack = StackArray.new(size)

while true
    puts "|--------------------------------------------------------------------|"
    puts "| Stack Operations                                                   |"
    puts "|--------------------------------------------------------------------|"
    puts "| 1. Push Data                                                       |"
    puts "|--------------------------------------------------------------------|"
    puts "| 2. Pop Data                                                        |"
    puts "|--------------------------------------------------------------------|"
    puts "| 3. Peek Data                                                       |"
    puts "|--------------------------------------------------------------------|"
    puts "| 4. Exit                                                            |"
    puts "|--------------------------------------------------------------------|"

    print "Enter your choice: "
    choice = gets.chomp.to_i

    case choice
    when 1
        print "Enter data to push: "
        data = gets.chomp
        stack.push(data)
    when 2
        stack.pop
    when 3
        stack.peek
    when 4
        break
    else
        puts "Invalid choice"
    end

end





