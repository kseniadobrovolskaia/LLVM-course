#include "GraphicalSnake.h"

static void putCell(int X, int Y, int Color) {
  X = getXCell(X);
  Y = getYCell(Y);

  for (int PixX = X * COEFF_X; PixX < (X + 1) * COEFF_X; ++PixX)
    for (int PixY = Y * COEFF_Y; PixY < (Y + 1) * COEFF_Y; ++PixY)
      putPixel(PixX, PixY, Color);
}

static void putContour(int SnakeCell) {
  int PrevCell = getSnakeCell(SnakeCell - 1);
  if (isHead(SnakeCell))
    PrevCell = SnakeCell;
  int NextCell = getSnakeCell(SnakeCell + 1);
  if (isHead(NextCell))
    NextCell = SnakeCell;

  int X = getSnakeX(SnakeCell), Y = getSnakeY(SnakeCell);
  int PrevX = getSnakeX(PrevCell), PrevY = getSnakeY(PrevCell);
  int NextX = getSnakeX(NextCell), NextY = getSnakeY(NextCell);

  // Up contour
  if (PrevY != getYCell(Y - 1) && NextY != getYCell(Y - 1)) {
    for (int PixX = X * COEFF_X; PixX < (X + 1) * COEFF_X; ++PixX) {
      for (int PixY = Y * COEFF_Y; PixY < Y * COEFF_Y + SNAKE_CONTOUR_SIZE;
           ++PixY)
        putPixel(PixX, PixY, SNAKE_CONTOUR);
    }
  }

  // Down contour
  if (PrevY != getYCell(Y + 1) && NextY != getYCell(Y + 1)) {
    for (int PixX = X * COEFF_X; PixX < (X + 1) * COEFF_X; ++PixX) {
      for (int PixY = (Y + 1) * COEFF_Y - SNAKE_CONTOUR_SIZE;
           PixY < (Y + 1) * COEFF_Y; ++PixY)
        putPixel(PixX, PixY, SNAKE_CONTOUR);
    }
  }

  // Right contour
  if (PrevX != getXCell(X + 1) && NextX != getXCell(X + 1)) {
    for (int PixX = (X + 1) * COEFF_X - SNAKE_CONTOUR_SIZE;
         PixX < (X + 1) * COEFF_X; ++PixX) {
      for (int PixY = Y * COEFF_Y; PixY < (Y + 1) * COEFF_Y; ++PixY)
        putPixel(PixX, PixY, SNAKE_CONTOUR);
    }
  }

  // Left contour
  if (PrevX != getXCell(X - 1) && NextX != getXCell(X - 1)) {
    for (int PixX = X * COEFF_X; PixX < X * COEFF_X + SNAKE_CONTOUR_SIZE;
         ++PixX) {
      for (int PixY = Y * COEFF_Y; PixY < (Y + 1) * COEFF_Y; ++PixY)
        putPixel(PixX, PixY, SNAKE_CONTOUR);
    }
  }
}

static void putCells() {
  for (int X = 0; X < MESH_X_SIZE; ++X) {
    for (int Y = 0; Y < MESH_Y_SIZE; ++Y)
      putCell(X, Y, BACKGROUND_COLOR);
  }
  for (int SnakeCell = 0; SnakeCell < SNAKE_LEN; ++SnakeCell) {
    putCell(getSnakeX(SnakeCell), getSnakeY(SnakeCell),
            isHead(SnakeCell) ? SNAKE_HEAD : SNAKE_COLOR);
    putContour(SnakeCell);
  }
}

void runSnake() {
  initSnake();
  while (1) {
    putCells();
    updateSnake();
    updateScreen();
  }
}
