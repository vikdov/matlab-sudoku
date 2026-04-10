function isValid = sudoku_validator(sudoku)
    % Check if the given Sudoku puzzle is valid
    
    % Check rows and columns
    for i = 1:9
        if ~check_group(sudoku(i, :)) || ~check_group(sudoku(:, i))
            isValid = false;
            return;
        end
    end

    % Check 3x3 subgrids
    for r = 1:3
        for c = 1:3
            if ~check_group(sudoku(3*(r-1)+1:3*r, 3*(c-1)+1:3*c))
                isValid = false;
                return;
            end
        end
    end

    isValid = true;  % Sudoku puzzle is valid
end

function isComplete = check_solution(sudoku)
    % Check if the Sudoku puzzle is completely solved and correct
    isComplete = sudoku_validator(sudoku) && all(sudoku(:) ~= 0);
end

function isGroupValid = check_group(group)
    % Check if a group (row, column, or 3x3 subgrid) contains all numbers 1-9
    isGroupValid = all(ismember(1:9, group));
end