# DOKUMENTACJA

## Project Overview
This project implements a Sudoku solver using various algorithms in MATLAB, providing an efficient solution to the popular puzzle game.

## File Structure
- `solver.m`: Contains the main algorithm for solving Sudoku.
- `gui.m`: Graphical user interface for user interaction.
- `data/`: Directory containing example Sudoku puzzles.
- `tests/`: Unit tests for verifying algorithm correctness.

## Algorithms
1. **Backtracking Algorithm**: A recursive solution that explores potential placements for numbers in empty cells.
2. **Constraint Propagation**: Reduces possibilities based on current board state before solving.

## Usage Instructions
1. Clone the repository: `git clone https://github.com/vikdov/matlab-sudoku.git`
2. Navigate to the directory: `cd matlab-sudoku`
3. Run the solver: `solver()`
4. Optional: Launch the GUI: `gui()`

## Examples
### Example 1
To solve a given Sudoku puzzle, input the initial state:
```matlab
initial_state = [5 3 0 0 7 0 0 0 0; ... ];
solution = solver(initial_state);
```

### Example 2
To use the graphical interface:
```matlab
gui();
```

## MATLAB Syntax Explanation
- **Matrices**: Sudoku boards are represented as 9x9 matrices, where zeros denote empty cells.
- **Functions**: Use functions for modular code that performs specific tasks, such as validation and solving.

## Sources
- [Sudoku at Wikipedia](https://en.wikipedia.org/wiki/Sudoku)
- MATLAB Documentation
- Various online resources regarding algorithm implementations.
