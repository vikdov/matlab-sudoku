function sudoku_display(board)
    % Function to display the Sudoku board in a formatted output
    disp('===================');
    for i = 1:9
        row = '';
        for j = 1:9
            row = [row, sprintf('%d ', board(i,j))];
            if mod(j, 3) == 0 && j < 9
                row = [row, '| '];
            end
        end
        disp(row);
        if mod(i, 3) == 0 && i < 9
            disp('-------------------');
        end
    end
    disp('===================');
end