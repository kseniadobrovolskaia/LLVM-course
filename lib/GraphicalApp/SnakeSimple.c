#include "GraphicalApp.h"

#define SNAKE_LEN 3

#define MESH_X_SIZE 16
#define MESH_Y_SIZE 8

#define COEFF_X WINDOW_X_SIZE / MESH_X_SIZE
#define COEFF_Y WINDOW_Y_SIZE / MESH_Y_SIZE

#define BACKGROUND_COLOR 0x00b9f6ca
#define SNAKE_COLOR 0x00e1bee7

#define SNAKE_X 5

#define STEPS 5

#ifdef __cplusplus
extern "C" {
#endif // __cplusplus
void finalizeSnake() __attribute__((used)) __attribute__((naked))
__attribute__((noinline));
void finalizeSnake() {}
#ifdef __cplusplus
}
#endif // __cplusplus

static int getYCell(int CellY) { return (CellY + MESH_Y_SIZE) % MESH_Y_SIZE; }
static void putCell(int X, int Y, int Color) {
  Y = getYCell(Y);

  for (int PixX = X * COEFF_X; PixX < (X + 1) * COEFF_X; ++PixX) {
    for (int PixY = Y * COEFF_Y; PixY < (Y + 1) * COEFF_Y; ++PixY)
      putPixel(PixX, PixY, Color);
  }
}

void putCells(int SnakeHead) {
  for (int X = 0; X < MESH_X_SIZE; ++X) {
    for (int Y = 0; Y < MESH_Y_SIZE; ++Y)
      putCell(X, Y, BACKGROUND_COLOR);
  }
  for (int SnakeCell = 0; SnakeCell < SNAKE_LEN; ++SnakeCell)
    putCell(SNAKE_X, SnakeHead + SnakeCell, SNAKE_COLOR);
}

void runSnake() {
  int SnakeHead = 0;
  int NumStep = 0;
  while (NumStep++ < STEPS) {
    putCells(++SnakeHead);
    updateScreen();
  }
  finalizeSnake();
}
