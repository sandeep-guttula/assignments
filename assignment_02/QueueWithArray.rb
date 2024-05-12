class QueueArray
  def initialize(size = 0)
    @size = size
    @queue = Array.new(@size)
    @front = 0
    @rear = -1
    @length = 0
    puts "Queue created with size #{@size}"
  end

  def enqueue(data)
    if @length == @size
      puts "Queue is full"
      return
    end

    @rear += 1
    @queue[@rear] = data
    @length += 1
    display_queue
  end

  def dequeue
    if @length == 0
      puts "Queue is empty"
      return
    end

    puts "Dequeued data: #{@queue[@front]}"

    i = 0
    while i < @rear
      @queue[i] = @queue[i + 1]
      i += 1
    end

    @rear -= 1
    @length -= 1
    display_queue
    
  end

  def display_queue
    puts "\n\n\n--- Queue ---"
    current = @rear
    while current >= @front
      print "| #{@queue[current]} |"
      current -= 1
    end
    puts "\n\n\n"
  end
end

puts "Enter the size of the queue"
size = gets.chomp.to_i
queue = QueueArray.new(size)

while true
  puts "|--------------------------------------------------------------------|"
  puts "| Queue Operations                                                  |"
  puts "|--------------------------------------------------------------------|"
  puts "| 1. Enqueue Data                                                    |"
  puts "|--------------------------------------------------------------------|"
  puts "| 2. Dequeue Data                                                    |"
  puts "|--------------------------------------------------------------------|"
  puts "| 3. Show Data                                                       |"
  puts "|--------------------------------------------------------------------|"
  puts "| 4. Exit                                                            |"
  puts "|--------------------------------------------------------------------|"

  print "Enter your choice: "
  choice = gets.chomp.to_i

  case choice
  when 1
    print "Enter data to enqueue: "
    data = gets.chomp
    queue.enqueue(data)
  when 2
    queue.dequeue
  when 3
    queue.display_queue
  when 4
    break
  else
    puts "Invalid choice"
  end
end
