% Test Suite for Sudoku Solver

function test_sudoku_solver()
    disp('Running tests for the Sudoku solver...');

    % Test case 1: Valid Sudoku
    sudoku1 = [5 3 0 0 7 0 0 0 0;
               6 0 0 1 9 5 0 0 0;
               0 9 8 0 0 0 0 6 0;
               8 0 0 0 6 0 0 0 3;
               4 0 0 8 0 3 0 0 1;
               7 0 0 0 2 0 0 0 6;
               0 6 0 0 0 0 2 8 0;
               0 0 0 4 1 9 0 0 5;
               0 0 0 0 8 0 0 7 9];
    expected_solution1 = [5 3 4 6 7 8 9 1 2;
                          6 7 2 1 9 5 3 4 8;
                          1 9 8 3 4 2 5 6 7;
                          8 5 9 7 6 1 2 4 3;
                          4 2 6 8 5 3 7 9 1;
                          7 1 3 9 2 4 8 5 6;
                          9 6 1 2 3 5 4 7 8;
                          2 8 7 4 1 9 6 3 5;
                          3 4 5 2 8 6 1 7 9];

    result1 = sudoku_solver(sudoku1);
    assert(isequal(result1, expected_solution1), 'Test case 1 failed!');

    % Test case 2: Invalid Sudoku (duplicate in row)
    sudoku2 = [5 3 0 0 7 0 0 0 0;
               6 0 0 1 9 5 0 0 0;
               0 9 8 0 5 0 0 6 0;
               8 0 0 0 6 0 0 0 3;
               4 0 0 8 0 3 0 0 1;
               7 0 0 0 2 0 0 0 6;
               0 6 0 0 0 0 2 8 0;
               0 0 0 4 1 9 0 0 5;
               0 0 0 0 8 0 0 7 9];

    result2 = sudoku_solver(sudoku2);
    % In this case, we expect the result to indicate failure or return an empty matrix
    assert(isempty(result2), 'Test case 2 failed!');

    % Test case 3: Completely filled valid Sudoku
    sudoku3 = [5 3 4 6 7 8 9 1 2;
                6 7 2 1 9 5 3 4 8;
                1 9 8 3 4 2 5 6 7;
                8 5 9 7 6 1 2 4 3;
                4 2 6 8 5 3 7 9 1;
                7 1 3 9 2 4 8 5 6;
                9 6 1 2 3 5 4 7 8;
                2 8 7 4 1 9 6 3 5;
                3 4 5 2 8 6 1 7 9];

    result3 = sudoku_solver(sudoku3);
    assert(isequal(result3, sudoku3), 'Test case 3 failed!');

    disp('All tests completed successfully.');
end
