# Write a Program to Mirror a Binary Tree

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
        @root = helper(@root,data)
    end

    def helper(node,data)
        if node.nil?
            return Node.new(data)
        end

        if data < node.data
            node.left = helper(node.left,data)
        else
            node.right = helper(node.right,data)
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

    def mirror(node = @root)
        if node.nil?
            return
        end

        mirror(node.left)
        mirror(node.right)
        node.left, node.right = node.right, node.left
        puts
    end

end


bt = BinaryTree.new
bt.add(5)
bt.add(3)
bt.add(7)
bt.add(2)
bt.add(4)
bt.add(6)
bt.add(8)
bt.printTree
puts
bt.preOrderTraversal
bt.mirror
bt.printTree
puts