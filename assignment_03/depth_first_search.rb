=begin
  Write a Program to take the adjacency matrix of a graph as input and perform Depth First Search
=end

class DepthFirstSearch

  def dfs(graph, start_node,visited)

    visited[start_node] = true

    print "#{start_node} "

    graph[start_node].each_with_index do |node, index|
      if node == 1 && visited[index] == false
        dfs(graph, index, visited)
      end
    end

  end

  def dfs_traversal(graph, start_node)

    visited = Array.new(graph.length, false)
    dfs(graph, start_node, visited)

  end

end


dfs = DepthFirstSearch.new

puts "Enter the number of vertices in the graph: "
vertices = gets.chomp.to_i

puts "Enter the adjacency matrix of the graph: "
graph = []
vertices.times do |i|
  graph << gets.chomp.split(" ").map(&:to_i)
end

puts "Enter the starting node: "
start_node = gets.chomp.to_i

dfs.dfs_traversal(graph, start_node)
