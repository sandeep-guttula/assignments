=begin
  Write a Program to take an array as input and sort it in ascending order using Quick Sort (Divide and Conquer)
=end


class QuickSort

  def swap(arr, i, j)
    temp = arr[i]
    arr[i] = arr[j]
    arr[j] = temp
  end

  def quick_sort(arr,low,high)


    if low < high
      pivot = partition(arr, low, high)
      quick_sort(arr, low, pivot-1)
      quick_sort(arr, pivot+1, high)
    end

    arr
  end

  def partition(arr,low,high)
    pivot = arr[low]
    i = low
    j = high

    while i < j

      while arr[i] <= pivot && i < high
        i += 1
      end

      while arr[j] > pivot
        j -= 1
      end

      if i < j

        swap(arr, i, j)

      end
    end

    swap(arr, low, j)
    j
  end

end


qs = QuickSort.new

puts "Enter the size of the array: "
n = gets.chomp.to_i

arr = Array.new(n)

puts "Enter the elements of the array: "
for i in 0...n
  arr[i] = gets.chomp.to_i
end

puts "The sorted array is: "
puts qs.quick_sort(arr,0,n-1).inspect
