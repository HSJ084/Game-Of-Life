int[][] grid;
int cols;
int rows;
int resolution = 10;

void setup() {
  size(600, 400);
  cols = width / resolution;
  rows = height / resolution;

  grid = new int[cols][rows];
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      grid[i][j] = floor(random(2));
    }
  }
}

void draw() {
  background(0);

  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      int x = i * resolution;
      int y = j * resolution;
      if (grid[i][j] == 1) {
        fill(255);
        stroke(0);
        rect(x, y, resolution - 1, resolution - 1);
      }
    }
  }

  int[][] next = new int[cols][rows];

  // Compute next based on grid
  for (int i = 0; i < cols; i++) {
    for (int j = 0; j < rows; j++) {
      int state = grid[i][j];
      // Count live neighbors!
      int sum = 0;
      int neighbors = countNeighbors(grid, i, j);

      if (state == 0 && neighbors == 3) {
        next[i][j] = 1;
      } else if (state == 1 && (neighbors < 2 || neighbors > 3)) {
        next[i][j] = 0;
      } else {
        next[i][j] = state;
      }

    }
  }

  grid = next;