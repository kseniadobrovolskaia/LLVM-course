#include "Snake.h"
#include <SDL2/SDL.h>
#include <assert.h>
#include <stdlib.h>
#include <time.h>

#define DELAY 50
#define SNAKE_LEN 9
#define SNAKE_CONTOUR_SIZE 1
#define MESH_X_SIZE 16
#define MESH_Y_SIZE 8
#define BACKGROUND_COLOR 0x00b9f6ca
#define SNAKE_COLOR 0x00e1bee7
#define SNAKE_CONTOUR 0x00000000
#define SNAKE_HEAD 0x00f8bbd0

static SDL_Renderer *Renderer = NULL;
static SDL_Window *Window = NULL;
static int SnakeCoords[SNAKE_LEN][2] = {{0}};
static int SnakeHead = 0;

static void failWithError(const char *Msg) {
  printf("%s\n", Msg);
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
    return !isThereCell(PrevCell[0] - 1, PrevCell[1]);
  else if (Choose == 1)
    return !isThereCell(PrevCell[0], PrevCell[1] + 1);
  else if (Choose == 2)
    return !isThereCell(PrevCell[0] + 1, PrevCell[1]);
  else if (Choose == 3)
    return !isThereCell(PrevCell[0], PrevCell[1] - 1);
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
    failWithError("Бог, как видно, забирает лучших");

  if (Choose == 0) {
    NewCell[0] = PrevCell[0] - 1;
    NewCell[1] = PrevCell[1];
  } else if (Choose == 1) {
    NewCell[0] = PrevCell[0];
    NewCell[1] = PrevCell[1] + 1;
  } else if (Choose == 2) {
    NewCell[0] = PrevCell[0] + 1;
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
  for (int SnakeCell = 1; SnakeCell < SNAKE_LEN; ++SnakeCell) {
    fillNewCell(SnakeCoords[SnakeCell], SnakeCoords[SnakeCell - 1]);
  }
}

static void updateSnake() {
  int NewHead[2] = {0};
  fillNewCell(NewHead, SnakeCoords[SnakeHead]);
  SnakeHead = (SnakeHead - 1 + SNAKE_LEN) % SNAKE_LEN;
  SnakeCoords[SnakeHead][0] = NewHead[0];
  SnakeCoords[SnakeHead][1] = NewHead[1];
}

static void putPixel(int PixX, int PixY, int Color) {
  if (PixX < 0)
    PixX += WINDOW_X_SIZE;
  if (PixY < 0)
    PixY += WINDOW_Y_SIZE;
  if (PixX >= WINDOW_X_SIZE)
    PixX %= WINDOW_X_SIZE;
  if (PixY >= WINDOW_Y_SIZE)
    PixY %= WINDOW_Y_SIZE;
  assert(0 <= PixX && PixX < WINDOW_X_SIZE && "Out of range");
  assert(0 <= PixY && PixY < WINDOW_Y_SIZE && "Out of range");
  Uint8 A = Color >> 24;
  Uint8 R = (Color >> 16) & 0xFF;
  Uint8 G = (Color >> 8) & 0xFF;
  Uint8 B = Color & 0xFF;

  SDL_SetRenderDrawColor(Renderer, R, G, B, A);
  SDL_RenderDrawPoint(Renderer, PixX, PixY);
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
  const int CoeffX = WINDOW_X_SIZE / MESH_X_SIZE;
  const int CoeffY = WINDOW_Y_SIZE / MESH_Y_SIZE;

  for (int PixX = X * CoeffX; PixX < (X + 1) * CoeffX; ++PixX)
    for (int PixY = Y * CoeffY; PixY < (Y + 1) * CoeffY; ++PixY)
      putPixel(PixX, PixY, Color);
}

static void putContour(int SnakeCell) {
  const int CoeffX = WINDOW_X_SIZE / MESH_X_SIZE;
  const int CoeffY = WINDOW_Y_SIZE / MESH_Y_SIZE;
  int PrevCell = (SnakeCell - 1 + SNAKE_LEN) % SNAKE_LEN;
  if (SnakeCell == SnakeHead)
    PrevCell = SnakeCell;
  int NextCell = (SnakeCell + 1) % SNAKE_LEN;
  if (NextCell == SnakeHead)
    NextCell = SnakeCell;
  int PrevX = SnakeCoords[PrevCell][0], PrevY = SnakeCoords[PrevCell][1];
  int NextX = SnakeCoords[NextCell][0], NextY = SnakeCoords[NextCell][1];
  int X = SnakeCoords[SnakeCell][0], Y = SnakeCoords[SnakeCell][1];

  if ((PrevY != Y - 1) && (NextY != Y - 1))
    for (int PixX = X * CoeffX; PixX < (X + 1) * CoeffX; ++PixX)
      for (int PixY = Y * CoeffY; PixY < Y * CoeffY + SNAKE_CONTOUR_SIZE;
           ++PixY)
        putPixel(PixX, PixY, SNAKE_CONTOUR);

  if ((PrevY != Y + 1) && (NextY != Y + 1))
    for (int PixX = X * CoeffX; PixX < (X + 1) * CoeffX; ++PixX)
      for (int PixY = (Y + 1) * CoeffY - SNAKE_CONTOUR_SIZE;
           PixY < (Y + 1) * CoeffY; ++PixY)
        putPixel(PixX, PixY, SNAKE_CONTOUR);

  if ((PrevX != X + 1) && (NextX != X + 1))
    for (int PixX = (X + 1) * CoeffX - SNAKE_CONTOUR_SIZE;
         PixX < (X + 1) * CoeffX; ++PixX)
      for (int PixY = Y * CoeffY; PixY < (Y + 1) * CoeffY; ++PixY)
        putPixel(PixX, PixY, SNAKE_CONTOUR);

  if ((PrevX != X - 1) && (NextX != X - 1))
    for (int PixX = X * CoeffX; PixX < X * CoeffX + SNAKE_CONTOUR_SIZE; ++PixX)
      for (int PixY = Y * CoeffY; PixY < (Y + 1) * CoeffY; ++PixY)
        putPixel(PixX, PixY, SNAKE_CONTOUR);
}

void putCells() {
  for (int X = 0; X < MESH_X_SIZE; ++X)
    for (int Y = 0; Y < MESH_Y_SIZE; ++Y)
      putCell(X, Y, BACKGROUND_COLOR);
  for (int SnakeCell = 0; SnakeCell < SNAKE_LEN; ++SnakeCell) {
    putCell(SnakeCoords[SnakeCell][0], SnakeCoords[SnakeCell][1],
            SnakeCell == SnakeHead ? SNAKE_HEAD : SNAKE_COLOR);
    putContour(SnakeCell);
  }
}

void initApp() {
  SDL_Init(SDL_INIT_VIDEO);
  SDL_CreateWindowAndRenderer(WINDOW_X_SIZE, WINDOW_Y_SIZE, 0, &Window,
                              &Renderer);
  SDL_SetRenderDrawColor(Renderer, 0, 0, 0, 0);
  SDL_RenderClear(Renderer);
  putPixel(0, 0, 0);
  updateScreen();
  initSnake();
}

void exitApp() {
  SDL_DestroyRenderer(Renderer);
  SDL_DestroyWindow(Window);
  SDL_Quit();
  exit(EXIT_SUCCESS);
}

void updateScreen() {
  updateSnake();
  SDL_PumpEvents();
  if (SDL_TRUE == SDL_HasEvent(SDL_QUIT))
    exitApp();
  SDL_Delay(DELAY);
  SDL_RenderPresent(Renderer);
}
