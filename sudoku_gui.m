function sudoku_gui
    % Create a MATLAB GUI for an interactive Sudoku solver
    hFig = figure('Position', [100, 100, 400, 400], 'MenuBar', 'none', 'Name', 'Sudoku Solver', 'NumberTitle', 'off', 'Resize', 'off');

    % Create a grid for Sudoku board
    boardAxes = axes('Parent', hFig, 'Position', [0.1, 0.2, 0.8, 0.7]);
    hold(boardAxes, 'on');
    gridSize = 9;
    cellSize = 40;

    % Draw the board
    for i = 0:gridSize
        plot([0, gridSize*cellSize], [i*cellSize, i*cellSize], 'k'); % horizontal lines
        plot([i*cellSize, i*cellSize], [0, gridSize*cellSize], 'k'); % vertical lines
    end

    % Create input fields for numbers
    numbers = zeros(gridSize);
    textHandles = gobjects(gridSize);
    for row = 1:gridSize
        for col = 1:gridSize
            textHandles(row, col) = text(col*cellSize-20, (gridSize-row+1)*cellSize-20, '', 'FontSize', 18, 'HorizontalAlignment', 'center');
        end
    end

    % Create buttons
    uicontrol('Style', 'pushbutton', 'String', 'Solve', 'Position', [50, 20, 100, 40], 'Callback', @(src, event) solveSudoku);
    uicontrol('Style', 'pushbutton', 'String', 'Clear', 'Position', [250, 20, 100, 40], 'Callback', @(src, event) clearBoard);

    function solveSudoku
        % Implement the logic to solve Sudoku here
        % For now, let's just represent it with a message box
        msgbox('Solve functionality is not implemented yet.');
    end

    function clearBoard
        for row = 1:gridSize
            for col = 1:gridSize
                numbers(row, col) = 0;
                set(textHandles(row, col), 'String', '');
            end
        end
    end

    % UI control to allow user to input numbers
    for row = 1:gridSize
        for col = 1:gridSize
            uicontrol('Style', 'edit', 'Position', [col*cellSize-30, (gridSize-row)*cellSize+5, 30, 30], 'Callback', @(src, event) updateNumber(src, row, col));
        end
    end

    function updateNumber(src, row, col)
        numbers(row, col) = str2double(get(src, 'String'));
        set(textHandles(row, col), 'String', num2str(numbers(row, col))); 
    end
end