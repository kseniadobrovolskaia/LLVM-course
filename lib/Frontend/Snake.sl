// This program draw a snake that crawls

// Function that draw snake
SsFun drawSnake {
  SsIf (step == 0) : loopSnakeY__
  Declarations:
    snakeplace = 100__
    snakewidth = 40__
    snakecolor = 14794471__ 
    snakey = step * snakewidth__
    SsCrawl loopSnakeY__
  loopSnakeY:
    snakex = snakeplace__
    SsIf (snakey < (step + 1) * snakewidth) : loopSnakeYEnd__
      loopSnakeX:
        SsIf (snakex < (snakeplace + snakewidth)) : loopSnakeXEnd__
          iterSnakeX:
            SsPutPixel(snakex, snakey, snakecolor)__
            snakex = snakex + 1__
            SsCrawl loopSnakeX__
      loopSnakeXEnd:
        snakey = snakey + 1__
        SsCrawl loopSnakeY__
  loopSnakeYEnd:
}

// Function that draw background
SsFun drawBackground {
  y = 0__
  SsCrawl loopY__
  loopY:
    x = 0__
    SsIf (y < 256) : loopYEnd__
      loopX:
        SsIf (x < 512) : loopXEnd__
          iterX:
            SsPutPixel(x, y, backgroundcolor)__
            x = x + 1__
            SsCrawl loopX__
      loopXEnd:
        y = y + 1__
        SsCrawl loopY__
  loopYEnd:
}

// Main Function that draw all
SsFun SsMain {
  step = 0__
  backgroundcolor = 12187338__
  SsCrawl loopStep__
  loopStep:
    SsCall drawBackground__
    SsCall drawSnake__
    SsUpdateScreen__
    SsIf (step < 10) : loopStepEnd__
      iterStep:
        step = step + 1__
        SsCrOut(step)__
        SsCrawl loopStep__
  loopStepEnd:
}



