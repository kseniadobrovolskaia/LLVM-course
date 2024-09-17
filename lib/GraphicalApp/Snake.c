#include <assert.h>
#include <stdio.h>
#include <stdlib.h>

#include "GraphicalSnake.h"

static int SnakeCoords[SNAKE_LEN][2] = {{-1}};
static int SnakeHead = 0;

static void failWithError(const char *Msg) {
  fprintf(stderr, "%s\n", Msg);
  exit(EXIT_FAILURE);
}

static int getRand() { return rand(); }

int getXCell(int CellX) { return (CellX + MESH_X_SIZE) % MESH_X_SIZE; }

int getYCell(int CellY) { return (CellY + MESH_Y_SIZE) % MESH_Y_SIZE; }

static int isThereCell(int X, int Y) {
  for (int SnakeCell = 0; SnakeCell < SNAKE_LEN; ++SnakeCell) {
    if (SnakeCoords[SnakeCell][0] == getXCell(X) &&
        SnakeCoords[SnakeCell][1] == getYCell(Y))
      return 1;
  }
  return 0;
}

typedef enum ChooseT { Left, Up, Right, Down, ChooseSize } ChooseT;

static int isLegalChoose(ChooseT Choose, int PrevCell[2]) {
  switch (Choose) {
  case Left:
    return !isThereCell(PrevCell[0] - 1, PrevCell[1]);
  case Up:
    return !isThereCell(PrevCell[0], PrevCell[1] + 1);
  case Right:
    return !isThereCell(PrevCell[0] + 1, PrevCell[1]);
  case Down:
    return !isThereCell(PrevCell[0], PrevCell[1] - 1);
  default:
    failWithError("Unknown Choose");
  }
  return 0;
}

static void fillNewCell(int NewCell[2], int PrevCell[2]) {
  int Choose = getRand() % ChooseSize;
  int AttemptsLeft = ChooseSize;
  while (!isLegalChoose(Choose, PrevCell) && --AttemptsLeft > 0)
    Choose = (Choose + 1) % ChooseSize;

  if (AttemptsLeft == 0)
    failWithError("Господь, как видно, забирает лучших.");

  switch (Choose) {
  case Left: {
    NewCell[0] = getXCell(PrevCell[0] - 1);
    NewCell[1] = PrevCell[1];
    break;
  }
  case Up: {
    NewCell[0] = PrevCell[0];
    NewCell[1] = getYCell(PrevCell[1] + 1);
    break;
  }
  case Right: {
    NewCell[0] = getXCell(PrevCell[0] + 1);
    NewCell[1] = PrevCell[1];
    break;
  }
  case Down: {
    NewCell[0] = PrevCell[0];
    NewCell[1] = getYCell(PrevCell[1] - 1);
    break;
  }
  default:
    failWithError("Unknown Choose");
  }
}

void initSnake() {
  int Seed = 0;
  srand(Seed);
  int StartX = getRand() % MESH_X_SIZE;
  int StartY = getRand() % MESH_Y_SIZE;
  SnakeCoords[SnakeHead][0] = StartX;
  SnakeCoords[SnakeHead][1] = StartY;
  for (int SnakeCell = 1; SnakeCell < SNAKE_LEN; ++SnakeCell)
    fillNewCell(SnakeCoords[SnakeCell], SnakeCoords[SnakeCell - 1]);
}

void updateSnake() {
  int NewHead[2] = {0};
  fillNewCell(NewHead, SnakeCoords[SnakeHead]);
  SnakeHead = (SnakeHead - 1 + SNAKE_LEN) % SNAKE_LEN;
  SnakeCoords[SnakeHead][0] = NewHead[0];
  SnakeCoords[SnakeHead][1] = NewHead[1];
}

int getSnakeX(int Cell) { return SnakeCoords[Cell][0]; }

int getSnakeY(int Cell) { return SnakeCoords[Cell][1]; }

int getSnakeCell(int Cell) { return (Cell + SNAKE_LEN) % SNAKE_LEN; }

int isHead(int Cell) { return Cell == SnakeHead; }
