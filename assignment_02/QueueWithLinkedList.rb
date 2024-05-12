=begin
    Write a Program to Implement Queue with a Linked List and perform the following operations:
    Enqueue Data
    Dequeue Data
    Show Data
=end

class Node
    attr_accessor :data, :next_node
  
    def initialize(data)
      @data = data
      @next_node = nil
    end
end


class Queue
    
    def initialize
        @front = nil
        @rear = nil
        @length = 0
    end

    def enqueue(data)
        new_node = Node.new(data)
        if @front == nil
            @front = new_node
            @rear = new_node
        else
            @rear.next_node = new_node
            @rear = new_node
        end
        @length += 1
        printQueue
    end

    def dequeue
        if @front == nil
            puts "Queue is empty"
            return
        end
        puts "Dequeued data: #{@front.data}"
        @front = @front.next_node
        @length -= 1
        printQueue
    end

    def printQueue
        if @front == nil
            puts "Queue is empty"
            return
        end

        temp = @front
        while temp != nil
            print "| #{temp.data}  |"
            temp = temp.next_node
        end
        puts "nil"
    end
end


queue = Queue.new

while true
    puts "|--------------------------------------------------------------------|"
    puts "| Queue Operations                                                   |"
    puts "|--------------------------------------------------------------------|"
    puts "| 1. Enqueue Data                                                    |"
    puts "|--------------------------------------------------------------------|"
    puts "| 2. Dequeue Data                                                    |"
    puts "|--------------------------------------------------------------------|"
    puts "| 3. Show Data                                                       |"
    puts "|--------------------------------------------------------------------|"
    puts "Enter your choice"
    choice = gets.chomp.to_i
    case choice
    when 1
        puts "Enter data to enqueue"
        data = gets.chomp
        queue.enqueue(data)
    when 2
        queue.dequeue
    when 3
        queue.printQueue
    else
        puts "Invalid choice"
    end
end