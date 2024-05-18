=begin
  Write a Program to take an array as input and sort it in ascending order using Merge Sort
=end


class MergeSort

  def merge_sort(arr)

    if arr.length <= 1
      return arr
    end

    # Getting the mid point of the array
    mid = arr.length / 2

    left = merge_sort(arr[0...mid]) # recursive call on left half

    right = merge_sort(arr[mid..-1]) # recursive call on right half

    merge(arr, left,mid, right) # merging the left and right halves
  end

  def merge(arr, left, mid, right)

    i = 0
    j = 0
    k = 0

    while i < left.length && j < right.length

      if left[i] < right[j]
        arr[k] = left[i]
        i += 1
      else
        arr[k] = right[j]
        j += 1
      end
      k += 1
    end

    while i < left.length

      arr[k] = left[i]
      i += 1
      k += 1
    end

    while j < right.length

      arr[k] = right[j]
      j += 1
      k += 1
    end

    return arr
  end

end


ms = MergeSort.new

# Get the array size
puts "Enter the size of the array: "
n = gets.chomp.to_i

# Get array elements from the user
arr = Array.new(n)
puts "Enter the elements of the array: "
for i in 0...n
  arr[i] = gets.chomp.to_i
end

puts "The sorted array is: "
puts ms.merge_sort(arr).inspect
