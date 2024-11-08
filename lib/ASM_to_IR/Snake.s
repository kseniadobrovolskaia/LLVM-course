runSnake
  XOR x0 x0 x0
  XOR x14 x14 x14
  BR_NOT x0 loop_snake

loop_snake
  ADD x2 x21 x10
  MODI x3 x2 8
  SLI x8 x3 5
  SLI x5 x3 8
  ADDI x5 x5 256
  DIVI x7 x5 8
  CMP_LT x20 x8 x7
  BR_NOT x0 loop_snake_pixel_y

loop_snake_pixel_y
  UPDATE_SCREEN
  XOR x9 x9 x9
  ADDI x9 x0 160
  BR_NOT x20 inc_snake_pixel_y

loop_snake_pixel_x
  PUT_PIXEL x9 x8 14794471 
  ADDI x9 x9 1
  ADDI x30 x0 192
  CMP_EQ x1 x9 x30
  BR_NOT x1 loop_snake_pixel_x

inc_snake_pixel_y
  ADDI x8 x8 1
  CMP_EQ x1 x8 x7
  BR_NOT x1 loop_snake_pixel_y

inc_snake
  ADDI x10 x10 1
  ADDI x30 x0 8
  CMP_EQ x1 x10 x30
  BR_NOT x1 loop_snake

exit
  EXIT
