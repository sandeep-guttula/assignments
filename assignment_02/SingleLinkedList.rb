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

    def add_at_start(data)
        current = @head

        # If the head is nil, create a new node with the data
        if current == nil
            @head = Node.new(data)
        else
            # Create a new node with the data and set the next_node to the current head
            new_node = Node.new(data)
            new_node.next_node = current
            @head = new_node
        end
        @length += 1
        display_single_linked_list
    end

    def add_at_end(data)
        if @head == nil
            @head = Node.new(data)
        else
            current = @head
            # Traversign the linked list till the last node
            while current.next_node != nil
                current = current.next_node
            end

            # Creating a new node with the data and setting the next_node of the last node to the new node
            current.next_node = Node.new(data)
        end
        @length += 1
        display_single_linked_list
    end

    def insert_at_middle(index,data)

        # If the index is greater than the length of the linked list, return
        if index > @length 
            puts "Insertion is not possible at index #{index}. Length of list is #{@length}"
            return
        end

        if index == 0
            add_at_start(data)
        elsif index == @length
            add_at_end(data)
        else
            current = @head
            new_node = Node.new(data)
            
            i = 1
            # Traversing the linked list till the index - 1
            while i < index - 1
                current = current.next_node
                i += 1
            end

            # Setting the next_node of the new node to the next_node of the current node
            new_node.next_node = current.next_node
            current.next_node = new_node
            @length += 1
            display_single_linked_list
        end
    end

    def reverse_linked_list
        current = @head
        previous_node = nil
        next_node = nil
        puts "#{current.data}"

        # Traversing the linked list and reversing the next_node of the current node to the previous node
        while current != nil
            next_node = current.next_node
            current.next_node = previous_node
            previous_node = current
            current = next_node
        end
        @head = previous_node
        display_single_linked_list
    end

    def display_single_linked_list
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
            sll.add_at_start(data)
        when 2
            print "Enter the data to be added at the end of the list: "
            data = gets.chomp
            sll.add_at_end(data)
        when 3
            print "Enter the index at which the data to be added: "
            index = gets.chomp.to_i
            print "Enter the data to be added at the index #{index}: "
            data = gets.chomp
            sll.insert_at_middle(index,data)
        when 4
            sll.reverse_linked_list
        when 5
            break
        else
            puts "Invalid choice"
    end
end

