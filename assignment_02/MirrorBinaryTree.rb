# Write a Program to Mirror a Binary Tree

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

    def mirror(node = @root)

        # If the node is nil, return
        if node.nil?
            return
        end

        # Recursively call the mirror function on the left and right nodes
        mirror(node.left)
        mirror(node.right)
        # Swap the left and right nodes
        node.left, node.right = node.right, node.left
        puts
    end

end


bt = BinaryTree.new

while true
    puts "|-------------------------------------------------------------------- |"
    puts "| Binary Tree Operations                                              |"
    puts "|---------------------------------------------------------------------|"
    puts "| 1. Add data to the binary tree                                      |"
    puts "| 2. Print the binary tree                                            |"
    puts "| 3. Mirror the binary tree                                           |"
    puts "| 4. Exit                                                             |"
    puts "|-------------------------------------------------------------------- |"
    print "Enter your choice: "
    choice = gets.chomp.to_i

    case choice
    when 1
        print "Enter the data to be added to the binary tree: "
        data = gets.chomp.to_i
        bt.add(data)
    when 2
        puts "The binary tree is:"
        bt.printTree
        puts
    when 3
        bt.mirror
        puts "The binary tree has been mirrored"
    when 4
        break
    else
        puts "Invalid choice"
    end
end