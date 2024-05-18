=begin
  Write a Program to take an array as input and sort it in ascending order using Heap Sort
=end


class HeapSort


  def heapify(arr, n, i)

    max_element = i
    left = 2*i
    right = (2*i)+1

    if left < n && arr[left] > arr[max_element]
      max_element = left
    end

    if right < n && arr[right] > arr[max_element]
      max_element = right
    end

    if max_element != i
      arr[i], arr[max_element] = arr[max_element], arr[i]
      heapify(arr, n, max_element)
    end

  end

  def heap_sort(arr)

    n = arr.length

    i = n/2 - 1
    while i >= 0
      heapify(arr, n, i)
      i -= 1
    end

    j = n-1
    while j >= 0
      arr[0], arr[j] = arr[j], arr[0]
      heapify(arr, j, 0)
      j -= 1
    end

    arr
  end

end


heap_sort = HeapSort.new

puts "Enter the size of the array: "

size = gets.chomp.to_i

puts "Enter the elements of the array: "

arr = gets.chomp.split(" ").map(&:to_i)

puts heap_sort.heap_sort(arr).inspect

puts "The sorted array is: #{arr}"
