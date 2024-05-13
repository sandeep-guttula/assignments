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


    def preOrderTraversal(node = @root)
        
        # If the node is nil, return
        if node.nil?
            return
        end
        
        print "#{node.data} "

        preOrderTraversal(node.left)
        preOrderTraversal(node.right)
    end

    def inOrderTraversal(node = @root)

        # If the node is nil, return
        if node.nil?
            return
        end
        inOrderTraversal(node.left)
        print "#{node.data} "
        inOrderTraversal(node.right)
    end

    def postOrderTraversal(node = @root)
        # If the node is nil, return
        if node.nil?
            return
        end

        postOrderTraversal(node.left)
        postOrderTraversal(node.right)
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

bst.preOrderTraversal
puts 

bst.inOrderTraversal
puts

bst.postOrderTraversal
puts
