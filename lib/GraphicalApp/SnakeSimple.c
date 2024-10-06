#include "GraphicalApp.h"

#define SNAKE_LEN 8

#define MESH_X_SIZE 16
#define MESH_Y_SIZE 8

#define COEFF_X WINDOW_X_SIZE / MESH_X_SIZE
#define COEFF_Y WINDOW_Y_SIZE / MESH_Y_SIZE

#define BACKGROUND_COLOR 0x00b9f6ca
#define SNAKE_COLOR 0x00e1bee7

#define COUNT_CHOOSE 4
#define MOVE_LEFT 0
#define MOVE_UP 1
#define MOVE_RIGHT 2
#define MOVE_DOWN 3

#define STEPS 5

static int getXCell(int CellX) { return (CellX + MESH_X_SIZE) % MESH_X_SIZE; }

static int getYCell(int CellY) { return (CellY + MESH_Y_SIZE) % MESH_Y_SIZE; }

static void putCell(int X, int Y, int Color) {
  X = getXCell(X);
  Y = getYCell(Y);

  for (int PixX = X * COEFF_X; PixX < (X + 1) * COEFF_X; ++PixX) {
    for (int PixY = Y * COEFF_Y; PixY < (Y + 1) * COEFF_Y; ++PixY)
      putPixel(PixX, PixY, Color);
  }
}

static int isThereCell(int X, int Y, int SnakeCoords[SNAKE_LEN][2]) {
  for (int SnakeCell = 0; SnakeCell < SNAKE_LEN; ++SnakeCell) {
    if (SnakeCoords[SnakeCell][0] == getXCell(X) &&
        SnakeCoords[SnakeCell][1] == getYCell(Y))
      return 1;
  }
  return 0;
}

static int isLegalChoose(int Choose, int PrevCell[2],
                         int SnakeCoords[SNAKE_LEN][2]) {
  if (Choose == MOVE_LEFT)
    return !isThereCell(PrevCell[0] - 1, PrevCell[1], SnakeCoords);
  if (Choose == MOVE_UP)
    return !isThereCell(PrevCell[0], PrevCell[1] + 1, SnakeCoords);
  if (Choose == MOVE_RIGHT)
    return !isThereCell(PrevCell[0] + 1, PrevCell[1], SnakeCoords);
  if (Choose == MOVE_DOWN)
    return !isThereCell(PrevCell[0], PrevCell[1] - 1, SnakeCoords);
  failWithError("Unknown Choose");
  return 0;
}

static void fillNewCell(int NewCell[2], int PrevCell[2],
                        int SnakeCoords[SNAKE_LEN][2]) {
  int Choose = getRand() % COUNT_CHOOSE;
  int AttemptsLeft = COUNT_CHOOSE;
  while (!isLegalChoose(Choose, PrevCell, SnakeCoords) && --AttemptsLeft > 0)
    Choose = (Choose + 1) % COUNT_CHOOSE;

  if (AttemptsLeft == 0)
    failWithError("Господь, как видно, забирает лучших.");

  if (Choose == MOVE_LEFT) {
    NewCell[0] = getXCell(PrevCell[0] - 1);
    NewCell[1] = PrevCell[1];
  } else if (Choose == MOVE_UP) {
    NewCell[0] = PrevCell[0];
    NewCell[1] = getYCell(PrevCell[1] + 1);
  } else if (Choose == MOVE_RIGHT) {
    NewCell[0] = getXCell(PrevCell[0] + 1);
    NewCell[1] = PrevCell[1];
  } else if (Choose == MOVE_DOWN) {
    NewCell[0] = PrevCell[0];
    NewCell[1] = getYCell(PrevCell[1] - 1);
  } else
    failWithError("Unknown Choose");
}

static void initSnake(int *SnakeHead, int SnakeCoords[SNAKE_LEN][2]) {
  const int StartX = getRand() % MESH_X_SIZE;
  const int StartY = getRand() % MESH_Y_SIZE;
  SnakeCoords[*SnakeHead][0] = StartX;
  SnakeCoords[*SnakeHead][1] = StartY;
  for (int SnakeCell = 1; SnakeCell < SNAKE_LEN; ++SnakeCell)
    fillNewCell(SnakeCoords[SnakeCell], SnakeCoords[SnakeCell - 1],
                SnakeCoords);
}

static void updateSnake(int *SnakeHead, int SnakeCoords[SNAKE_LEN][2]) {
  int NewHead[2] = {0};
  fillNewCell(NewHead, SnakeCoords[*SnakeHead], SnakeCoords);
  *SnakeHead = (*SnakeHead - 1 + SNAKE_LEN) % SNAKE_LEN;
  SnakeCoords[*SnakeHead][0] = NewHead[0];
  SnakeCoords[*SnakeHead][1] = NewHead[1];
}

static void putCells(int *SnakeHead, int SnakeCoords[SNAKE_LEN][2]) {
  for (int X = 0; X < MESH_X_SIZE; ++X) {
    for (int Y = 0; Y < MESH_Y_SIZE; ++Y)
      putCell(X, Y, BACKGROUND_COLOR);
  }
  for (int SnakeCell = 0; SnakeCell < SNAKE_LEN; ++SnakeCell)
    putCell(SnakeCoords[SnakeCell][0], SnakeCoords[SnakeCell][1], SNAKE_COLOR);
}

void runSnake() {
  int SnakeCoords[SNAKE_LEN][2] = {{-1}};
  int SnakeHead = 0;

  initSnake(&SnakeHead, SnakeCoords);
  int NumStep = 0;
  while (NumStep++ < STEPS) {
    putCells(&SnakeHead, SnakeCoords);
    updateSnake(&SnakeHead, SnakeCoords);
    updateScreen();
  }
}
