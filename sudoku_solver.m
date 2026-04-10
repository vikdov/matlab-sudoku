function solution = sudoku_solver(board)
    % This function solves a Sudoku puzzle using backtracking
    working_board = board;  % Work with a local copy (MATLAB uses copy-on-write semantics)
    if is_solved(working_board)
        solution = working_board;
        return;
    end
    [row, col] = find_empty(working_board);
    if row == -1  % No empty spaces
        solution = working_board;
        return;
    end
    for num = 1:9  % Try numbers from 1 to 9
        if is_valid(working_board, row, col, num)
            working_board(row, col) = num;  % Place the number
            solution = sudoku_solver(working_board);  % Recursion
            if ~isempty(solution)  % Check if we found a solution
                return;
            end
            working_board(row, col) = 0;  % Reset on backtrack
        end
    end
    solution = [];
end

function [row, col] = find_empty(board)
    % This function finds an empty space on the board
    for r = 1:9
        for c = 1:9
            if board(r,c) == 0
                row = r;
                col = c;
                return;
            end
        end
    end
    row = -1; col = -1;  % No empty spaces
end

function valid = is_valid(board, row, col, num)
    % This function checks if a number can be placed at a given position
    % The current cell (row, col) is excluded from all checks
    valid = true;
    % Check row (excluding current cell)
    rowVals = board(row, :);
    rowVals(col) = 0;
    if any(rowVals == num)
        valid = false;
        return;
    end
    % Check column (excluding current cell)
    colVals = board(:, col);
    colVals(row) = 0;
    if any(colVals == num)
        valid = false;
        return;
    end
    % Check 3x3 grid (excluding current cell)
    startRow = floor((row - 1) / 3) * 3 + 1;
    startCol = floor((col - 1) / 3) * 3 + 1;
    for r = startRow:startRow+2
        for c = startCol:startCol+2
            if r == row && c == col
                continue;
            end
            if board(r, c) == num
                valid = false;
                return;
            end
        end
    end
end

function solved = is_solved(board)
    % This function checks if the Sudoku board is solved
    solved = all(board(:) ~= 0);
end
