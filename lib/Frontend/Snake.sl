step = 0;
y = 0;
x = 0;
snakeplace = 100;
snakex = 0;
snakey = 0;
snakewidth = 40;

backgroundcolor = 12187338;
snakecolor = 14794471; 

func main
  step = 0;
  goto loopStep;

  loopStep:
    y = 0;
    if step < 100 | loopY | loopStep_end;
      loopY:
        x = 0;
        if y < 256 | loopX | loopY_end;
          loopX:
            if x < 512 | iterX | loopX_end;
              iterX:
                PUT(x, y, backgroundcolor);
                x = x + 1;
                goto loopX;
          loopX_end:
            y = y + 1;
            goto loopY;
      loopY_end:
        goto loopSnakeY;
      loopSnakeY:
        snakex = snakeplace;
        if snakey < (step + 1) * snakewidth | loopSnakeX | loopSnakeY_end;
          loopSnakeX:
            if snakex < snakeplace + snakewidth | iterSnakeX | loopSnakeX_end;
              iterSnakeX:
                PUT(snakex, snakey, snakecolor);
                snakex = snakex + 1;
                goto loopSnakeX;
          loopSnakeX_end:
            snakey = snakey + 1;
            goto loopSnakeY;
      loopSnakeY_end:
        step = step + 1;
        snakey = step * snakewidth;
        FLUSH;
        goto loopStep;
  loopStep_end:
end



