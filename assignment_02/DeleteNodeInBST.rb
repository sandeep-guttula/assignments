=begin
    Write a Program to delete a specific node in a Binary Search Tree. Once deleted, please re-balance the tree if the need arises
=end


class Node
    attr_accessor :data, :left, :right

    def initialize(data)
        @data = data
        @left = nil
        @right = nil
    end

end

class BinaryTree

    def initialize
        @root = nil
    end

    def add(data)
        @root = helper(@root, data)
    end

    def helper(node, data)
        if node.nil?
            return Node.new(data)
        end

        if data < node.data
            # Recursively call the helper function on the left node
            node.left = helper(node.left, data)
        else
            # Recursively call the helper function on the right node
            node.right = helper(node.right, data)
        end
        return node
    end

    def printTree(node = @root)
        if node.nil?
            return
        end
        printTree(node.left)
        print "#{node.data} "
        printTree(node.right)
    end

    def deleteNode(data)
        @root = deleteHelper(@root, data)
    end

    def deleteHelper(node, data)

        # If the node is nil, return
        if node.nil?
            return node
        end

        if data < node.data
            # Recursively call the deleteHelper function on the left node
            node.left = deleteHelper(node.left, data)
        elsif data > node.data
            # Recursively call the deleteHelper function on the right node
            node.right = deleteHelper(node.right, data)
        else
            if node.left.nil?
                return node.right
            elsif node.right.nil?
                return node.left
            end

            # If the node has two children then get the minimum value in the right subtree
            node.data = minValue(node.right)
            node.right = deleteHelper(node.right, node.data)
        end
        return node
        
    end

    # Find the minimum value in the tree
    def minValue(node)
        current = node
        # iterating through the left nodes to find the minimum value
        while current.left != nil
            current = current.left
        end
        return current.data
    end

end

# Create a binary tree
tree = BinaryTree.new

while true
    
    puts "|--------------------------------------------------------------------|"
    puts "| 1. Add data to the binary tree                                     |"
    puts "|--------------------------------------------------------------------|"
    puts "| 2. Delete a specific node in the binary tree                       |"
    puts "|--------------------------------------------------------------------|"
    puts "| 3. Print the binary tree                                           |"
    puts "|--------------------------------------------------------------------|"
    puts "| 4. Exit                                                            |"
    puts "|--------------------------------------------------------------------|"
    print "Enter your choice: "

    choice = gets.chomp.to_i

    case choice
    when 1
        print "Enter the data: "
        data = gets.chomp.to_i
        tree.add(data)
    when 2
        print "Enter the data to delete: "
        data = gets.chomp.to_i
        tree.deleteNode(data)
    when 3
        tree.printTree
        puts
    when 4
        break
    else
        puts "Invalid choice"
    end
end