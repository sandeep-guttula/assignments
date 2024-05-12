=begin
    Write a Program to create a Doubly Linked List and perform the following operations on the same:
    Add data to the beginning of the list
    Add data to the end of end of the list
    Add data in the middle of the list - index provided by the user
    Reverse the Linked List
    You can create your own Linked List and perform these operations. We should display the linked list after each operation
=end

class Node 

    attr_accessor :data, :next_node, :prev_node

    def initialize(data)
        @data = data
        @next_node = nil
        @prev_node = nil
    end

end

class DoublyLinkedList
    def initialize
        @head = nil
        @length = 0
    end

    def addAtStart(data)
        current = @head
        if current == nil?
            @head = Node.new(data)
        end

        new_node = Node.new(data)
        
        new_node.next_node = @head
        @head = new_node
        @length += 1
        printList
    end

    def addAtLast(data)
        current = @head
        if current == nil
            @head = Node.new(data)
        else
            while current.next_node != nil
                current = current.next_node
            end
            current.next_node = Node.new(data)
        end
        @length += 1
        printList
    end

    def addAtPosition(index,data)

        if index > @length
            puts "Insertion is not possible at index #{index}. Length of list is #{@length}"
            return
        end

        if index == 1
            addAtStart(data)
        elsif index == @length
            addAtLast(data)
        else
            current = @head
            new_node = Node.new(data)

            i = 1
            while i < index-1
                current = current.next_node
                i += 1
            end 

            new_node.next_node = current.next_node
            current.next_node = new_node
            new_node.prev_node = current
            @length += 1
        end
        printList
    end


    def reverseList
        current = @head
        prev = nil
        while current != nil
            next_node = current.next_node
            current.next_node = prev
            current.prev_node = next_node
            prev = current
            current = next_node
        end
        @head = prev
        printList
    end


    def printList
        puts
        current = @head
        while current != nil
            print "|#{current.data}| -> "
            current = current.next_node
        end
        puts "End"
        puts
    end
end


dll = DoublyLinkedList.new

while true
    puts "|--------------------------------------------------------------------|"
    puts "| Linked List Operations                                              |"
    puts "|--------------------------------------------------------------------|"
    puts "| 1. Add data to the beginning of the list                           |"
    puts "|--------------------------------------------------------------------|"
    puts "| 2. Add data to the end of end of the list                          |" 
    puts "|--------------------------------------------------------------------|"
    puts "| 3. Add data at certine position                                    |"
    puts "|--------------------------------------------------------------------|"
    puts "| 4. Reverse the Linked List                                         |"
    puts "|--------------------------------------------------------------------|"
    puts "| 5. Exit                                                            |"
    puts "|--------------------------------------------------------------------|"

    print "Enter your choice: "
    choice = gets.chomp.to_i
    
    case choice
        when 1
            print "Enter the data to be added at the beginning of the list: "
            data = gets.chomp
            dll.addAtStart(data)
        when 2
            print "Enter the data to be added at the end of the list: "
            data = gets.chomp
            dll.addAtLast(data)
        when 3
            print "Enter the index at which the data to be added: "
            index = gets.chomp.to_i
            print "Enter the data to be added at the index #{index}: "
            data = gets.chomp
            dll.addAtPosition(index,data)
        when 4
            dll.reverseList
        when 5
            break
        else
            puts "Invalid choice"
    end
end

