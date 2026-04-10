# Project Overview
This project is designed to implement a Sudoku solver in MATLAB. It takes a partially filled Sudoku grid as input and utilizes various algorithms to fill in the empty cells to form a valid Sudoku solution.

## Usage Instructions
1. Clone the repository to your local machine.
2. Open MATLAB and navigate to the directory where the repository is cloned.
3. Use the `solveSudoku` function with the Sudoku grid as an input argument. For example:
   ```matlab
   grid = [5 3 0 0 7 0 0 0 0; 6 0 0 1 9 5 0 0 0; 0 9 8 0 0 0 0 6 0; 8 0 0 0 6 0 0 0 3; 4 0 0 8 0 3 0 0 1; 7 0 0 0 2 0 0 0 6; 0 6 0 0 0 0 2 8 0; 0 0 0 4 1 9 0 0 5; 0 0 0 0 8 0 0 7 9];
   solution = solveSudoku(grid);
   ```
4. The result will be a completed Sudoku grid.

Feel free to modify the algorithms to improve efficiency or add new features!