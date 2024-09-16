#include <assert.h>
#include <stdio.h>
#include <stdlib.h>

#include "GraphicalApp.h"

#define SNAKE_LEN 8
#define SNAKE_CONTOUR_SIZE 1

#define MESH_X_SIZE 16
#define MESH_Y_SIZE 8

#define COEFF_X WINDOW_X_SIZE / MESH_X_SIZE
#define COEFF_Y WINDOW_Y_SIZE / MESH_Y_SIZE

#define BACKGROUND_COLOR 0x00b9f6ca
#define SNAKE_COLOR 0x00e1bee7
#define SNAKE_CONTOUR 0x00000000
#define SNAKE_HEAD 0x00f8bbd0

static int SnakeCoords[SNAKE_LEN][2] = {{-1}};
static int SnakeHead = 0;

static void failWithError(const char *Msg) {
  fprintf(stderr, "%s\n", Msg);
  exit(EXIT_FAILURE);
}

static int getRand() { return rand(); }

static int isThereCell(int X, int Y) {
  for (int SnakeCell = 0; SnakeCell < SNAKE_LEN; ++SnakeCell) {
    if (SnakeCoords[SnakeCell][0] == X && SnakeCoords[SnakeCell][1] == Y)
      return 1;
  }
  return 0;
}

static int isLegalChoose(int Choose, int PrevCell[2]) {
  if (Choose == 0)
    return !isThereCell((PrevCell[0] - 1 + MESH_X_SIZE) % MESH_X_SIZE,
                        PrevCell[1]);
  else if (Choose == 1)
    return !isThereCell(PrevCell[0], (PrevCell[1] + 1) % MESH_Y_SIZE);
  else if (Choose == 2)
    return !isThereCell((PrevCell[0] + 1) % MESH_X_SIZE, PrevCell[1]);
  else if (Choose == 3)
    return !isThereCell(PrevCell[0],
                        (PrevCell[1] - 1 + MESH_Y_SIZE) % MESH_Y_SIZE);
  else
    failWithError("Unknown Choose");
  return 0;
}

static void fillNewCell(int NewCell[2], int PrevCell[2]) {
  int Choose = getRand() % 4;
  int AttemptsLeft = 4;
  while (!isLegalChoose(Choose, PrevCell) && --AttemptsLeft > 0)
    Choose = (Choose + 1) % 4;

  if (AttemptsLeft == 0)
    failWithError("Господь, как видно, забирает лучших.");

  if (Choose == 0) {
    NewCell[0] = PrevCell[0] - 1;
    NewCell[1] = PrevCell[1];
  } else if (Choose == 1) {
    NewCell[0] = PrevCell[0];
    NewCell[1] = (PrevCell[1] + 1) % MESH_Y_SIZE;
  } else if (Choose == 2) {
    NewCell[0] = (PrevCell[0] + 1) % MESH_X_SIZE;
    NewCell[1] = PrevCell[1];
  } else if (Choose == 3) {
    NewCell[0] = PrevCell[0];
    NewCell[1] = PrevCell[1] - 1;
  } else {
    failWithError("Unknown Choose");
  }
  if (NewCell[0] < 0)
    NewCell[0] += MESH_X_SIZE;
  if (NewCell[1] < 0)
    NewCell[1] += MESH_Y_SIZE;
}

static void initSnake() {
  int Seed = 0;
  srand(Seed);
  int StartX = getRand() % MESH_X_SIZE;
  int StartY = getRand() % MESH_Y_SIZE;
  SnakeCoords[SnakeHead][0] = StartX;
  SnakeCoords[SnakeHead][1] = StartY;
  for (int SnakeCell = 1; SnakeCell < SNAKE_LEN; ++SnakeCell)
    fillNewCell(SnakeCoords[SnakeCell], SnakeCoords[SnakeCell - 1]);
}

static void updateSnake() {
  int NewHead[2] = {0};
  fillNewCell(NewHead, SnakeCoords[SnakeHead]);
  SnakeHead = (SnakeHead - 1 + SNAKE_LEN) % SNAKE_LEN;
  SnakeCoords[SnakeHead][0] = NewHead[0];
  SnakeCoords[SnakeHead][1] = NewHead[1];
}

static void putCell(int X, int Y, int Color) {
  if (X < 0)
    X += MESH_X_SIZE;
  if (Y < 0)
    Y += MESH_Y_SIZE;
  if (X >= MESH_X_SIZE)
    X %= MESH_X_SIZE;
  if (Y >= MESH_Y_SIZE)
    Y %= MESH_Y_SIZE;
  assert(0 <= X && X < MESH_X_SIZE && "Out of range");
  assert(0 <= Y && Y < MESH_Y_SIZE && "Out of range");

  for (int PixX = X * COEFF_X; PixX < (X + 1) * COEFF_X; ++PixX)
    for (int PixY = Y * COEFF_Y; PixY < (Y + 1) * COEFF_Y; ++PixY)
      putPixel(PixX, PixY, Color);
}

static void putContour(int SnakeCell) {
  int PrevCell = (SnakeCell - 1 + SNAKE_LEN) % SNAKE_LEN;
  if (SnakeCell == SnakeHead)
    PrevCell = SnakeCell;
  int NextCell = (SnakeCell + 1) % SNAKE_LEN;
  if (NextCell == SnakeHead)
    NextCell = SnakeCell;
  int PrevX = SnakeCoords[PrevCell][0], PrevY = SnakeCoords[PrevCell][1];
  int NextX = SnakeCoords[NextCell][0], NextY = SnakeCoords[NextCell][1];
  int X = SnakeCoords[SnakeCell][0], Y = SnakeCoords[SnakeCell][1];

  // Up contour
  if ((PrevY != ((Y - 1 + MESH_Y_SIZE) % MESH_Y_SIZE)) &&
      (NextY != ((Y - 1 + MESH_Y_SIZE) % MESH_Y_SIZE)))
    for (int PixX = X * COEFF_X; PixX < (X + 1) * COEFF_X; ++PixX)
      for (int PixY = Y * COEFF_Y; PixY < Y * COEFF_Y + SNAKE_CONTOUR_SIZE;
           ++PixY)
        putPixel(PixX, PixY, SNAKE_CONTOUR);

  // Down contour
  if ((PrevY != ((Y + 1) % MESH_Y_SIZE)) && (NextY != ((Y + 1) % MESH_Y_SIZE)))
    for (int PixX = X * COEFF_X; PixX < (X + 1) * COEFF_X; ++PixX)
      for (int PixY = (Y + 1) * COEFF_Y - SNAKE_CONTOUR_SIZE;
           PixY < (Y + 1) * COEFF_Y; ++PixY)
        putPixel(PixX, PixY, SNAKE_CONTOUR);

  // Right contour
  if ((PrevX != ((X + 1) % MESH_X_SIZE)) && (NextX != ((X + 1) % MESH_X_SIZE)))
    for (int PixX = (X + 1) * COEFF_X - SNAKE_CONTOUR_SIZE;
         PixX < (X + 1) * COEFF_X; ++PixX)
      for (int PixY = Y * COEFF_Y; PixY < (Y + 1) * COEFF_Y; ++PixY)
        putPixel(PixX, PixY, SNAKE_CONTOUR);

  // Left contour
  if ((PrevX != ((X - 1 + MESH_X_SIZE) % MESH_X_SIZE)) &&
      (NextX != ((X - 1 + MESH_X_SIZE) % MESH_X_SIZE)))
    for (int PixX = X * COEFF_X; PixX < X * COEFF_X + SNAKE_CONTOUR_SIZE;
         ++PixX)
      for (int PixY = Y * COEFF_Y; PixY < (Y + 1) * COEFF_Y; ++PixY)
        putPixel(PixX, PixY, SNAKE_CONTOUR);
}

static void putCells() {
  for (int X = 0; X < MESH_X_SIZE; ++X) {
    for (int Y = 0; Y < MESH_Y_SIZE; ++Y)
      putCell(X, Y, BACKGROUND_COLOR);
  }
  for (int SnakeCell = 0; SnakeCell < SNAKE_LEN; ++SnakeCell) {
    putCell(SnakeCoords[SnakeCell][0], SnakeCoords[SnakeCell][1],
            SnakeCell == SnakeHead ? SNAKE_HEAD : SNAKE_COLOR);
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
