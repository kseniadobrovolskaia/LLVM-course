runSnake:
  XOR x0 x0 x0
  ADDI x22 x0 512
  ADDI x23 x0 256
  ADDI x30 x0 192
  ADDI x15 x0 30
  BR_NOT x0 main_loop

main_loop:
  ADDI x7 x7 30
  ADDI x16 x16 1
  CMP_LT x1 x16 x15
  BR_NOT x1 exit

loop_background:
  UPDATE_SCREEN
  XOR x12 x12 x12
  BR_NOT x0 loop_y

loop_y:
  XOR x13 x13 x13
  BR_NOT x0 loop_x

loop_x:
  PUT_PIXEL x12 x13 12187338
  ADDI x13 x13 1
  CMP_EQ x1 x13 x23
  BR_NOT x1 loop_x

inc_y:
  ADDI x12 x12 1
  CMP_EQ x1 x12 x22
  BR_NOT x1 loop_y
 
loop_snake_pixel_y:
  ADDI x9 x0 160
  BR_NOT x0 loop_snake_pixel_x

loop_snake_pixel_x:
  PUT_PIXEL x9 x8 14794471 
  ADDI x9 x9 1
  CMP_EQ x1 x9 x30
  BR_NOT x1 loop_snake_pixel_x

inc_snake_pixel_y:
  ADDI x8 x8 1
  CMP_EQ x1 x8 x7
  BR_NOT x1 loop_snake_pixel_y

cont_main_loop:
  BR_NOT x0 main_loop

exit:
  EXIT
