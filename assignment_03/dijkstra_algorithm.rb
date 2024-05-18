=begin
  Write a Program to take the adjacency matrix of a weighted graph as input and find the shortest path in the same using Dijkstra’s algorithm
=end


class DijkstraAlgorithm

  def dijkstra_algorithm(graph, start_node)

    vertices = graph.length

    visited = Array.new(vertices, false)

    distance = Array.new(vertices, Float::INFINITY)

    distance[start_node] = 0

    for i in 0...vertices-1

      u = min_distance(distance, visited)

      visited[u] = true

      for v in 0...vertices
        if graph[u][v] > 0 && visited[v] == false && distance[u] + graph[u][v] < distance[v]
          distance[v] = distance[u] + graph[u][v]
        end
      end

    end

    print_distance(distance)

  end

  def min_distance(distance, visited)
    min = Float::INFINITY
    min_index = -1

    distance.each_with_index do |d, i|
      if visited[i] == false && d <= min
        min = d
        min_index = i
      end
    end

    return min_index
  end

  def print_distance(distance)
    puts "Vertex \tDistance from Source"
    distance.each_with_index do |d, i|
      puts "#{i} \t #{d}"
    end
  end

end


puts "Enter the number of vertices in the graph: "
vertices = gets.chomp.to_i

puts "Enter the adjacency matrix of the graph: "
graph = []
vertices.times do |i|
  graph << gets.chomp.split(" ").map(&:to_i)
end

puts "Enter the starting node: "
start_node = gets.chomp.to_i

dijkstra = DijkstraAlgorithm.new
dijkstra.dijkstra_algorithm(graph, start_node)
