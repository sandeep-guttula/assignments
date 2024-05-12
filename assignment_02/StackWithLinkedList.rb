=begin
    Write a Program to Implement Stack with a Linked List and perform the following operations:
    Push Data
    Pop Data
    Peek Data
=end

class Node
    attr_accessor :data, :next_node
  
    def initialize(data)
      @data = data
      @next_node = nil
    end
  end
  
  class Stack
    def initialize
      @top = nil
      @length = 0
    end
  
    def push(data)
      new_node = Node.new(data)
      new_node.next_node = @top
      @top = new_node
      @length += 1
      display_stack
    end
  
    def pop
      if @top.nil?
        puts "Stack is empty."
        return
      end
      popped = @top.data
      @top = @top.next_node
      @length -= 1
      puts "Popped element: #{popped}"
      display_stack
    end
  
    def peek
      if @top.nil?
        puts "Stack is empty."
        return
      end
      puts "Top element: #{@top.data}"
    end
  
    def display_stack
      puts
      current = @top
      while !current.nil?
        # print "|#{current.data}|->"
        puts "| #{current.data} |"
        current = current.next_node
      end
      puts "End"
      puts
    end
  end
  
stack = Stack.new

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



  