% validate_entire_board.m

function isValid = validate_entire_board(board)
    % Validates a Sudoku board (partial or complete) for conflicts.
    % Zeros are treated as empty cells and are ignored.
    for i = 1:9
        if ~validate_row(board, i) || ~validate_col(board, i) || ~validate_grid(board, i)
            isValid = false;
            return;
        end
    end
    isValid = true;
end

function isValid = validate_row(board, row)
    % Validates a single row (ignores zeros)
    vals = board(row, board(row, :) > 0);
    isValid = length(unique(vals)) == length(vals);
end

function isValid = validate_col(board, col)
    % Validates a single column (ignores zeros)
    vals = board(board(:, col) > 0, col);
    isValid = length(unique(vals)) == length(vals);
end

function isValid = validate_grid(board, grid)
    % Validates a 3x3 grid (ignores zeros)
    startRow = floor((grid - 1) / 3) * 3 + 1;
    startCol = mod(grid - 1, 3) * 3 + 1;
    block = board(startRow:startRow+2, startCol:startCol+2);
    vals = block(block > 0);
    isValid = length(unique(vals)) == length(vals);
end