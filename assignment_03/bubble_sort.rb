=begin
  Write a Program to take an array as input and sort it in ascending order using Bubble Sort
=end

class BubbleSort

  def bubble_sort(arr)

    n = arr.length - 1

    for i in 0...n
      for j in 0...(n-i)
        if arr[j] > arr[j+1]

          # swaping the elements

          temp = arr[j]
          arr[j] = arr[j+1]
          arr[j+1] = temp

        end

      end

    end

    arr
  end # function end
end


bs = BubbleSort.new

puts "Enter the size of the array: "
n = gets.chomp.to_i

arr = Array.new(n)
puts "Enter the elements of the array: "
for i in 0...n
  arr[i] = gets.chomp.to_i
end

puts "The sorted array is: "
puts bs.bubble_sort(arr).inspect
