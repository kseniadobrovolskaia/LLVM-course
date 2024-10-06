#include <SDL.h>
#include <assert.h>
#include <stdio.h>
#include <stdlib.h>

#include "GraphicalApp.h"

#define DELAY 50

static SDL_Renderer *Renderer = NULL;
static SDL_Window *Window = NULL;

int getRand() { return rand(); }

void failWithError(const char *Msg) {
  fprintf(stderr, "%s\n", Msg);
  exit(EXIT_FAILURE);
}

static int getXPixel(int PixX) {
  return (PixX + WINDOW_X_SIZE) % WINDOW_X_SIZE;
}

static int getYPixel(int PixY) {
  return (PixY + WINDOW_Y_SIZE) % WINDOW_Y_SIZE;
}

void putPixel(int PixX, int PixY, int Color) {
  PixX = getXPixel(PixX);
  PixY = getYPixel(PixY);
  assert(0 <= PixX && PixX < WINDOW_X_SIZE && "Pixel out of range (x)");
  assert(0 <= PixY && PixY < WINDOW_Y_SIZE && "Pixel out of range (y)");
  Uint8 A = Color >> 24;
  Uint8 R = (Color >> 16) & 0xFF;
  Uint8 G = (Color >> 8) & 0xFF;
  Uint8 B = Color & 0xFF;

  SDL_SetRenderDrawColor(Renderer, R, G, B, A);
  SDL_RenderDrawPoint(Renderer, PixX, PixY);
}

void initApp() {
  const int Seed = 0;
  srand(Seed);
  SDL_Init(SDL_INIT_VIDEO);
  SDL_CreateWindowAndRenderer(WINDOW_X_SIZE, WINDOW_Y_SIZE, 0, &Window,
                              &Renderer);
  SDL_SetRenderDrawColor(Renderer, 0, 0, 0, 0);
  SDL_RenderClear(Renderer);
  putPixel(0, 0, 0);
  updateScreen();
}

void exitApp() {
  SDL_DestroyRenderer(Renderer);
  SDL_DestroyWindow(Window);
  SDL_Quit();
  exit(EXIT_SUCCESS);
}

void updateScreen() {
  SDL_PumpEvents();
  if (SDL_TRUE == SDL_HasEvent(SDL_QUIT))
    exitApp();
  SDL_Delay(DELAY);
  SDL_RenderPresent(Renderer);
}
