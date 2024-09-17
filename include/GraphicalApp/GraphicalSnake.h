#ifndef SNAKE_H
#define SNAKE_H

#define WINDOW_X_SIZE 512
#define WINDOW_Y_SIZE 256

void initApp();
void exitApp();
void updateScreen();
void putPixel(int PixX, int PixY, int Color);

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

void initSnake();
void updateSnake();
int getSnakeX(int Cell);
int getSnakeY(int Cell);
int getSnakeCell(int Cell);
int isHead(int Cell);
int getXCell(int CellX);
int getYCell(int CellY);

#endif // SNAKE_H
