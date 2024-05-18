=begin
  Write a Program to take the adjacency matrix of a weighted graph as input and find the MST using Prim’s Algorithm
=end


class PrimsAlgorithm

  def prims_algorithm(graph)

    vertices = graph.length

    mst = Array.new(vertices, false)

    key = Array.new(vertices, Float::INFINITY)

    parent = Array.new(vertices, -1)

    key[0] = 0

    for i in 0...vertices-1
      u = min_key(key, mst)

      mst[u] = true

      for v in 0...vertices
        if graph[u][v] > 0 && mst[v] == false && graph[u][v] < key[v]
          parent[v] = u
          key[v] = graph[u][v]
        end
      end
    end

    print_mst(parent, graph)

  end

  def min_key(key, mst)
    min = Float::INFINITY
    min_index = -1

    key.each_with_index do |k, i|
      if mst[i] == false && k < min
        min = k
        min_index = i
      end
    end

    return min_index
  end

  def print_mst(parent, graph)
    vertices = graph.length
    puts "Edge \tWeight"
    (1...vertices).each do |i|
      puts "#{parent[i]} - #{i} \t #{graph[i][parent[i]]}"
    end
  end

end



prims = PrimsAlgorithm.new

puts "Enter the number of vertices in the graph: "
vertices = gets.chomp.to_i

puts "Enter the adjacency matrix of the graph: "
graph = []
vertices.times do |i|
  graph << gets.chomp.split(" ").map(&:to_i)
end

prims.prims_algorithm(graph)
