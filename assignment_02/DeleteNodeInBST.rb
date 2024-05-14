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

    def print_tree(node = @root)
        if node.nil?
            return
        end
        print_tree(node.left)
        print "#{node.data} "
        print_tree(node.right)
    end

    def delete_node(data)
        @root = delete_helper(@root, data)
    end

    def delete_helper(node, data)

        # If the node is nil, return
        if node.nil?
            return node
        end

        if data < node.data
            # Recursively call the delete_helper function on the left node
            node.left = delete_helper(node.left, data)
        elsif data > node.data
            # Recursively call the delete_helper function on the right node
            node.right = delete_helper(node.right, data)
        else
            if node.left.nil?
                return node.right
            elsif node.right.nil?
                return node.left
            end

            # If the node has two children then get the minimum value in the right subtree
            node.data = min_value(node.right)
            node.right = delete_helper(node.right, node.data)
        end
        return node
        
    end

    # Find the minimum value in the tree
    def min_value(node)
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
        tree.delete_node(data)
    when 3
        tree.print_tree
        puts
    when 4
        break
    else
        puts "Invalid choice"
    end
end