=begin
    Write a Program to perform a Matrix Multiplication. You should take two matrices as input and display the product as an output. If multiplication is not possible, an error should be thrown
=end

def matrix_multiplication(matrix1, matrix2)
    rows_1,cols_1 = matrix1.length, matrix1[0].length
    rows_2,cols_2 = matrix2.length, matrix2[0].length

    if cols_1 != rows_2
        return "Matrix multiplication not possible"
    end

    result = Array.new(rows_1) { Array.new(cols_2, 0) }

    for i in 0...rows_1
        for j in 0...cols_2
            for k in 0...cols_1
                result[i][j] += matrix1[i][k] * matrix2[k][j]
            end
        end
    end

    return result
end

puts "Enter dimensions for Matrix 1 (rows x cols):"
rows_1, cols_1 = gets.chomp.split(" ").map(&:to_i)


puts "Enter elements for Matrix 1:"
matrix1 = Array.new(rows_1) { gets.chomp.split(" ").map(&:to_i) }

puts "Enter dimensions for Matrix 2 (rows x cols):"
rows_2, cols_2 = gets.chomp.split(" ").map(&:to_i)

puts "Enter elements for Matrix 2:"
matrix2 = Array.new(rows_2) { gets.chomp.split(" ").map(&:to_i) }

result = matrix_multiplication(matrix1, matrix2)

if result == "Matrix multiplication not possible"
    puts result
else
    puts "Multiplication of the two matrices is:"
    result.each do |row|
        puts row.join(" ")
    end
end
