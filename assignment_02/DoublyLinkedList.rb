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