=begin
    Write a Program to create a Singly Linked List and perform the following operations on the same:
    Add data to the beginning of the list
    Add data to the end of end of the list
    Add data in the middle of the list - index provided by the user
    Reverse the Linked List
    You can create your own Linked List and perform these operations. We should display the linked list after each operation
=end

class Node 

    attr_accessor :data, :next_node

    # New Node is created with data and next_node as nil when the object is created
    def initialize(data)
        @data = data
        @next_node = nil
    end

end


class SingleLinkedList
    
    
    # initializeing the head of the linked list with nil 
    def initialize
        @head = nil
        @length = 0
    end

    def addAtStart(data)
        current = @head

        if current == nil
            @head = Node.new(data)
        else
            new_node = Node.new(data)
            new_node.next_node = current
            @head = new_node
        end
        @length += 1
        displaySingleLinkedList
    end

    def addAtEnd(data)
        if @head == nil
            @head = Node.new(data)
        else
            current = @head
            while current.next_node != nil
                current = current.next_node
            end
            current.next_node = Node.new(data)
        end
        @length += 1
        displaySingleLinkedList
    end

    def insertAtMiddle(index,data)
        if index > @length 
            puts "Insertion is not possible at index #{index}. Length of list is #{@length}"
            return
        end

        if index == 0
            addAtStart(data)
        elsif index == @length
            addAtEnd(data)
        else
            current = @head
            new_node = Node.new(data)
            
            i = 1
            while i < index - 1
                current = current.next_node
                i += 1
            end

            new_node.next_node = current.next_node
            current.next_node = new_node
            @length += 1
            displaySingleLinkedList
        end
    end

    def reverseLinkedList
        current = @head
        previous_node = nil
        next_node = nil
        puts "#{current.data}"

        while current != nil
            next_node = current.next_node
            current.next_node = previous_node
            previous_node = current
            current = next_node
        end
        @head = previous_node
        displaySingleLinkedList
    end

    def displaySingleLinkedList
        puts
        current = @head
        while !current.nil?
            print "|#{current.data}|->"
            current = current.next_node
        end
        puts "End"
        puts
    end


end

sll = SingleLinkedList.new

while true
    puts "|--------------------------------------------------------------------|"
    puts "| Linked List Operations                                             |"
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
            sll.addAtStart(data)
        when 2
            print "Enter the data to be added at the end of the list: "
            data = gets.chomp
            sll.addAtEnd(data)
        when 3
            print "Enter the index at which the data to be added: "
            index = gets.chomp.to_i
            print "Enter the data to be added at the index #{index}: "
            data = gets.chomp
            sll.insertAtMiddle(index,data)
        when 4
            sll.reverseLinkedList
        when 5
            break
        else
            puts "Invalid choice"
    end
end

