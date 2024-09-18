#ifndef GRAPHICAL_APP_H
#define GRAPHICAL_APP_H

#define WINDOW_X_SIZE 512
#define WINDOW_Y_SIZE 256

void initApp();
void exitApp();
void updateScreen();
void putPixel(int PixX, int PixY, int Color);

int getRand();
void failWithError(const char *Msg);

#endif // GRAPHICAL_APP_H
