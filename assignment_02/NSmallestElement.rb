=begin
    Write a Program to find the Nth smallest element in a Binary Search Tree. 
    Eg: Given n = 7, the output should be the 7th smallest element in the BST. 
    We should throw an error if the tree does not have as many nodes as specified
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

class BinaryTree

    # Initialize the binary tree
    def initialize
        @root = nil
    end

    # Add data to the binary tree
    def add(data)
        @root = helper(@root,data)
    end

    # Helper function to add data to the binary tree
    def helper(node,data)

        # If the node is nil, return a new node with the data
        if node.nil?
            return Node.new(data)
        end

        # If the data is less than the node data, recursively call the helper function on the left node
        if data < node.data
            node.left = helper(node.left,data)
        else
            node.right = helper(node.right,data)
        end

        return node
    end

    def printTree(node = @root)
        # If the node is nil, return
        if node.nil?
            return
        end
        printTree(node.left)
        print "#{node.data} "
        printTree(node.right)
    end

    def nthSmallestElement(node = @root,n)
        @count = 0
        @result = 0

        helperNthSmallestElement(node,n)
        if @count < n
            puts "The tree does not have #{n} nodes"
            return
        end
        return @result
    end

    def helperNthSmallestElement(node,n)
        if node.nil?
            return
        end

        helperNthSmallestElement(node.left,n)

        # Incrementing the count and check if the count is equal to n
        @count += 1
        if @count == n
            @result = node.data
        end
        helperNthSmallestElement(node.right,n)
    end

end

bt = BinaryTree.new
puts "Enter the number of elements you want to add in the BST: "
n = gets.chomp.to_i

puts "Enter the elements: "
for i in 0...n
    data = gets.chomp.to_i
    bt.add(data)
end

bt.printTree
puts
puts "Enter the value of n"
n = gets.chomp.to_i
puts "The #{n}th smallest element in the BST is: #{bt.nthSmallestElement(n)}"
