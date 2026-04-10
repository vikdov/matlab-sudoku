% sudoku_helpers.m

function [row, col] = find_empty_cell(board)
    % Finds an empty cell in the Sudoku board
    for row = 1:9
        for col = 1:9
            if board(row, col) == 0
                return;
            end
        end
    end
    row = -1; col = -1; % Return -1 if no empty cell is found
end

function isSolved = check_if_solved(board)
    % Checks if the Sudoku board is solved
    isSolved = all(board(:) ~= 0);
end

function isValid = validate_move(board, row, col, num)
    % Validates a move in the Sudoku board
    % Check the row
    if any(board(row, :) == num)
        isValid = false;
        return;
    end
    % Check the column
    if any(board(:, col) == num)
        isValid = false;
        return;
    end
    % Check the 3x3 grid
    startRow = floor((row - 1) / 3) * 3 + 1;
    startCol = floor((col - 1) / 3) * 3 + 1;
    if any(board(startRow:startRow+2, startCol:startCol+2) == num)
        isValid = false;
        return;
    end
    isValid = true;
end

function isValid = validate_entire_board(board)
    % Validates the entire Sudoku board
    for i = 1:9
        if ~validate_row(board, i) || ~validate_col(board, i) || ~validate_grid(board, i)
            isValid = false;
            return;
        end
    end
    isValid = true;
end

function isValid = validate_row(board, row)
    % Validates a single row
    isValid = length(unique(board(row, board(row, :) > 0))) == sum(board(row, :) > 0);
end

function isValid = validate_col(board, col)
    % Validates a single column
    isValid = length(unique(board(board(:, col) > 0, col))) == sum(board(:, col) > 0);
end

function isValid = validate_grid(board, grid)
    % Validates a 3x3 grid
    startRow = floor((grid - 1) / 3) * 3 + 1;
    startCol = mod(grid - 1, 3) * 3 + 1;
    isValid = length(unique(board(startRow:startRow+2, startCol:startCol+2)(board(startRow:startRow+2, startCol:startCol+2) > 0))) == sum(board(startRow:startRow+2, startCol:startCol+2) > 0);
end