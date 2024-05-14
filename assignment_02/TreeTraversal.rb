=begin
    Write a Program to take a Binary Search Tree (BST) as input and perform the following operations:
    Perform Pre-Order Traversal
    Perform In-Order Traversal
    Perform Post-Order Traversal
    Please ensure we validate if the tree is a BST or not
=end

class Node 
    attr_accessor :data, :left, :right

    # Initialize the node with data
    def initialize(data)
        @data = data
        @left = nil
        @right = nil
    end

end


class BinarySearchTree
    def initialize
        @root = nil
    end

    def add(data)
        @root = helper(@root, data)
    end

    def helper(node, data)

        # If the node is nil, return a new node with the data
        if node.nil?
            return Node.new(data)
        end

        # check if the data is less than the node data
        if data < node.data
            node.left = helper(node.left, data)
        else
            node.right = helper(node.right, data)
        end
        return node
    end


    def pre_order_traversal(node = @root)
        
        # If the node is nil, return
        if node.nil?
            return
        end
        
        print "#{node.data} "

        pre_order_traversal(node.left)
        pre_order_traversal(node.right)
    end

    def in_order_traversal(node = @root)

        # If the node is nil, return
        if node.nil?
            return
        end
        in_order_traversal(node.left)
        print "#{node.data} "
        in_order_traversal(node.right)
    end

    def post_order_traversal(node = @root)
        # If the node is nil, return
        if node.nil?
            return
        end

        post_order_traversal(node.left)
        post_order_traversal(node.right)
        print "#{node.data} "
    end

    

end



bst = BinarySearchTree.new

puts "Enter the number of elements you want to add in the BST: "
n = gets.chomp.to_i

puts "Enter the elements: "
for i in 0...n
    data = gets.chomp.to_i
    bst.add(data)
end

bst.pre_order_traversal
puts 

bst.in_order_traversal
puts

bst.post_order_traversal
puts
