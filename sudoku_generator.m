function safe = is_safe(board, row, col, num)
    % Check if 'num' is not present in current row
    if any(board(row, :) == num)
        safe = false;
        return;
    end

    % Check if 'num' is not present in current column
    if any(board(:, col) == num)
        safe = false;
        return;
    end

    % Calculate the starting point of the 3x3 box
    box_start_row = floor((row - 1) / 3) * 3 + 1;
    box_start_col = floor((col - 1) / 3) * 3 + 1;

    % Check if 'num' is not present in the corresponding 3x3 box
    if any(any(board(box_start_row:box_start_row+2, box_start_col:box_start_col+2) == num))
        safe = false;
        return;
    end

    % If all checks passed, it's safe to place 'num'
    safe = true;
end
