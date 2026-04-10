function solution = sudoku_solver(board)
    % Sudoku Solver using backtracking algorithm
    % Input: 9x9 grid (board) with 0s for empty spaces
    % Output: Solved 9x9 grid
    if is_solved(board)
        solution = board;
        return;
    end
    [row, col] = find_empty(board);
    for num = 1:9
        if is_valid(board, row, col, num)
            board(row, col) = num;
            solution = sudoku_solver(board);
            if ~isempty(solution)
                return;
            end
            board(row, col) = 0; % backtrack
        end
    end
    solution = []; % No solution found
end