% QUICKSTART.m
% Comprehensive Usage Guide for the Sudoku Solver Project

% Introduction
% This guide provides usage instructions for the Sudoku Solver project. 
% It covers how to run the main script, solve custom puzzles, validate solutions,
% generate random puzzles, and run tests.

%% Running the Main Script
% To run the main Sudoku solver script, use the following command:
main();

%% Solving Custom Puzzles
% You can solve a custom Sudoku puzzle by providing it as a matrix. 
% For example:
customPuzzle = [
    5 3 0 0 7 0 0 0 0;
    6 0 0 1 9 5 0 0 0;
    0 9 8 0 0 0 0 6 0;
    8 0 0 0 6 0 0 0 3;
    4 0 0 8 0 3 0 0 1;
    7 0 0 0 2 0 0 0 6;
    0 6 0 0 0 0 2 8 0;
    0 0 0 4 1 9 0 0 5;
    0 0 0 0 8 0 0 7 9;
];
solution = solveSudoku(customPuzzle);
disp(solution);

%% Validating Solutions
% To validate a Sudoku solution, use the following command:
isValid = validateSolution(solution);
if isValid
    disp('The solution is valid.');
else
    disp('The solution is invalid.');
end

%% Generating Random Puzzles
% To generate a random Sudoku puzzle, use the generatePuzzle function:
randomPuzzle = generatePuzzle();
disp(randomPuzzle);

%% Running Tests
% To run the unit tests for the Sudoku Solver, use the following command:
runTests();
