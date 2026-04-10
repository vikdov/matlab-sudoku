function isValid = sudoku_validator(puzzle)
    % Validate a Sudoku puzzle
    isValid = true;
    % Validate rows and columns
    for i = 1:9
        if ~check_group(puzzle(i, :)) || ~check_group(puzzle(:, i)')
            isValid = false;
            return;
        end
    end
    % Validate blocks
    for row = 1:3
        for col = 1:3
            block = puzzle((3*row-2):(3*row), (3*col-2):(3*col));
            if ~check_group(reshape(block, 1, []))
                isValid = false;
                return;
            end
        end
    end
end

function isValid = check_group(group)
    % Check if a given group (row, column, or block) contains all numbers 1-9 without zeros
    isValid = false; % Default to invalid
    if length(group) ~= 9
        return; % Not a valid group if not 9 elements
    end
    % Check for uniqueness and valid numbers
    uniqueNumbers = unique(group);
    if all(uniqueNumbers >= 1 & uniqueNumbers <= 9) && length(uniqueNumbers) == 9
        isValid = true; % Valid if contains all 1-9
    end
end