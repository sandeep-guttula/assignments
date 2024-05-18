=begin
  Write a Program to take the adjacency matrix of a graph as input and perform Breadth-First Search
=end


class BreadthFirstSearch

  def bfs(graph, start_node)

    visited = Array.new(graph.length, false)

    queue = []

    queue << start_node

    visited[start_node] = true

    while !queue.empty?

      current_node = queue.shift

      print "#{current_node} "

      graph[current_node].each_with_index do |node, index|
        if node == 1 && visited[index] == false
          queue << index
          visited[index] = true
        end
      end

    end

  end

end


bfs = BreadthFirstSearch.new

puts "Enter the number of vertices in the graph: "
vertices = gets.chomp.to_i

puts "Enter the adjacency matrix of the graph: "
graph = []
vertices.times do |i|
  graph << gets.chomp.split(" ").map(&:to_i)
end

puts "Enter the starting node: "
start_node = gets.chomp.to_i

bfs.bfs(graph, start_node)
