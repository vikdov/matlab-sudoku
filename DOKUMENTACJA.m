# DOKUMENTACJA

## Project Overview
This project implements a Sudoku solver using backtracking in MATLAB, providing an efficient solution to the popular puzzle game.

## File Structure
- `sudoku_solver.m`: Contains the main algorithm for solving Sudoku.
- `sudoku_gui.m`: Graphical user interface for user interaction.
- `sudoku_generator.m`: Generates random Sudoku puzzles.
- `sudoku_validator.m`: Validates a completed Sudoku solution.
- `validate_entire_board.m`: Validates incomplete Sudoku puzzles, detecting conflicts in rows, columns, and 3×3 boxes while allowing zeros for empty cells.
- `sudoku_display.m`: Functions for displaying the board.
- `test_sudoku_suite.m`: Unit tests for verifying algorithm correctness.

## Algorithms
1. **Backtracking Algorithm**: A recursive solution that explores potential placements for numbers in empty cells, backtracking when no valid placement exists.

## Usage Instructions
1. Clone the repository: `git clone https://github.com/vikdov/matlab-sudoku.git`
2. Navigate to the directory: `cd matlab-sudoku`
3. Run the solver: `sudoku_solver(board)`
4. Optional: Launch the GUI: `sudoku_gui()`

## Examples
### Example 1
To solve a given Sudoku puzzle, input the initial state:
```matlab
initial_state = [5 3 0 0 7 0 0 0 0; ... ];
solution = sudoku_solver(initial_state);
```

### Example 2
To use the graphical interface:
```matlab
sudoku_gui();
```

## MATLAB Syntax Explanation
- **Matrices**: Sudoku boards are represented as 9x9 matrices, where zeros denote empty cells.
- **Functions**: Use functions for modular code that performs specific tasks, such as validation and solving.

## Sources
- [Sudoku at Wikipedia](https://en.wikipedia.org/wiki/Sudoku)
- MATLAB Documentation
- Various online resources regarding algorithm implementations.
