function sudoku = sudoku_generator()
    % Generate a random Sudoku puzzle by removing numbers from a solved board
    board = generate_solved_board();
    puzzle = remove_numbers(board);
end

function board = generate_solved_board()
    % Generate a complete Sudoku board
    board = zeros(9);
    fill_board(board);
end

function fill_board(board)
    % Fill the board with numbers 1-9
    for i = 1:9
        for j = 1:9
            if board(i, j) == 0
                options = 1:9;
                while ~isempty(options)
                    val = options(randi(length(options)));
                    if is_safe(board, i, j, val)
                        board(i, j) = val;
                        fill_board(board);
                        if all(board(:))
                            return;
                        end
                        board(i, j) = 0;
                    end
                    options(options == val) = [];
                end
                return;
            end
        end
    end
end

function valid = is_safe(board, row, col, num)
    % Check if num can be placed at (row, col)
    valid = ~any(board(row, :) == num) && ~any(board(:, col) == num) && ~any(board((floor((row - 1)/3)*3 + 1):(floor((row - 1)/3)*3 + 3), (floor((col - 1)/3)*3 + 1):(floor((col - 1)/3)*3 + 3)) == num);
end

function puzzle = remove_numbers(board)
    % Remove numbers from the solved board to create a puzzle
    puzzle = board;
    num_to_remove = randi([40, 60]); % Randomly choose how many numbers to remove
    for i = 1:num_to_remove
        row = randi(9);
        col = randi(9);
        while puzzle(row, col) == 0
            row = randi(9);
            col = randi(9);
        end
        puzzle(row, col) = 0;
    end
end
