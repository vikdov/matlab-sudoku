function [isValid, errorMsg] = check_session(board)
    % Validates the current Sudoku board state for conflicts.
    % Allows partial boards: zeros are treated as empty cells and ignored.
    %
    % Returns:
    %   isValid  - true if no conflicts detected, false otherwise
    %   errorMsg - descriptive message; empty string when board is valid

    errorMsg = '';

    % Check each row for duplicate non-zero values
    for i = 1:9
        vals = board(i, board(i, :) > 0);
        if length(unique(vals)) < length(vals)
            isValid = false;
            errorMsg = sprintf('Duplicate number in row %d.', i);
            return;
        end
    end

    % Check each column for duplicate non-zero values
    for i = 1:9
        vals = board(board(:, i) > 0, i);
        if length(unique(vals)) < length(vals)
            isValid = false;
            errorMsg = sprintf('Duplicate number in column %d.', i);
            return;
        end
    end

    % Check each 3x3 box for duplicate non-zero values
    for boxRow = 0:2
        for boxCol = 0:2
            r1 = boxRow * 3 + 1;
            c1 = boxCol * 3 + 1;
            block = board(r1:r1+2, c1:c1+2);
            vals = block(block > 0);
            if length(unique(vals)) < length(vals)
                isValid = false;
                errorMsg = sprintf( ...
                    'Duplicate number in 3x3 box at rows %d-%d, cols %d-%d.', ...
                    r1, r1+2, c1, c1+2);
                return;
            end
        end
    end

    isValid = true;
end
