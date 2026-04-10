function puzzle = sudoku_generator()
    % Generate a random Sudoku puzzle by creating a solved board and removing cells
    % Start with an empty board
    board = zeros(9, 9);

    % Fill the board using backtracking with random number ordering
    board = fill_board(board);

    % Remove cells to create a puzzle (leave ~41 clues for a well-defined puzzle)
    puzzle = remove_cells(board, 40);
end

function board = fill_board(board)
    % Fill the board recursively using backtracking with random order
    for row = 1:9
        for col = 1:9
            if board(row, col) == 0
                nums = randperm(9);
                for k = 1:9
                    num = nums(k);
                    if is_safe_gen(board, row, col, num)
                        board(row, col) = num;
                        board = fill_board(board);
                        if all(board(:) ~= 0)
                            return;
                        end
                        board(row, col) = 0;
                    end
                end
                return;
            end
        end
    end
end

function puzzle = remove_cells(board, num_to_remove)
    % Remove 'num_to_remove' cells from a solved board to create a puzzle.
    % Note: uniqueness of the resulting puzzle is not guaranteed; the puzzle
    % may have multiple valid solutions.
    puzzle = board;
    positions = randperm(81, num_to_remove);
    for k = 1:length(positions)
        idx = positions(k);
        row = ceil(idx / 9);
        col = mod(idx - 1, 9) + 1;
        puzzle(row, col) = 0;
    end
end

function safe = is_safe_gen(board, row, col, num)
    % Check if num can be placed at (row, col)
    if any(board(row, :) == num)
        safe = false;
        return;
    end
    if any(board(:, col) == num)
        safe = false;
        return;
    end
    box_start_row = floor((row - 1) / 3) * 3 + 1;
    box_start_col = floor((col - 1) / 3) * 3 + 1;
    if any(any(board(box_start_row:box_start_row+2, box_start_col:box_start_col+2) == num))
        safe = false;
        return;
    end
    safe = true;
end
