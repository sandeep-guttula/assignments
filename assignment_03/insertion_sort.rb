=begin
  Write a Program to take an array as input and sort it in ascending order using Insertion Sort
=end


class InsertionSort

  def insertion_sort(arr)

    n = arr.length-1

    for i in  0..n

      j = i

      while j > 0 && (arr[j-1] > arr[j])
        temp = arr[j]
        arr[j] = arr[j-1]
        arr[j-1] = temp
        j -= 1
      end

    end

    arr

  end # Funcion end

end


is = InsertionSort.new

puts "Enter the size of the array: "
n = gets.chomp.to_i

arr = Array.new(n)
puts "Enter the elements of the array: "
for i in 0...n
  arr[i] = gets.chomp.to_i
end

puts "The sorted array is: "
puts is.insertion_sort(arr).inspect
