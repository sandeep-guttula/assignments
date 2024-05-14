=begin
    Write a Program to solve N-Queen’s Problem. Explanation: https://en.wikipedia.org/wiki/Eight_queens_puzzle
    Input: We should take the size of the board as an input (Minimum value should be 4)
    Output: We should return the index where the queen will be placed
=end


class NQueens
    def initialize(board_size)
        @board_size = board_size

        # Initializeing the board with 0
        @board = Array.new(@board_size) { Array.new(@board_size, 0) }
    end

    def solve_queens 
        if solve_helper(0)
            puts "Solution Exists:"
            printBoard
        else
            puts "Solution does not exist for this board size."
        end
    end

    def solve_helper(col)
        # checking if all queens are placed
        if col == @board_size
            return true
        end

        
        for i in 0...@board_size
            if is_safe(i, col)

                # Place the queen
                @board[i][col] = 1

                if solve_helper(col + 1)
                    return true
                end

                # Backtrack if the solution is not possible
                @board[i][col] = 0
            end
        end

        false
    end


    def is_safe(row, col)

        # Check row on left side
        for i in 0...col
            if @board[row][i] == 1
                return false
            end
        end

        # checking upper diagonal
        i, j = row, col
        while i >= 0 && j >= 0

            if @board[i][j] == 1
                return false
            end

            i -= 1
            j -= 1
        end

        # checking lower diagonal
        i, j = row, col
        while i < @board_size && j >= 0

            if @board[i][j] == 1
                return false
            end

            i += 1
            j -= 1
        end

        true
    end

    def printBoard

        for i in 0...@board_size
            for j in 0...@board_size
                print "#{@board[i][j]} "
            end
            puts
        end

    end
end
  
print "Enter the size of the board (minimum 4): "
board_size = gets.chomp.to_i

if board_size >= 4
    n_queens = NQueens.new(board_size)
    n_queens.solve_queens
else
    puts "Minimum board size should be 4."
end
  