void keyPressed() {
  //if (keyCode == UP) upkey = true;
  //if (keyCode == DOWN) downkey = true;
  //if (keyCode == LEFT) leftkey = true;
  //if (keyCode == RIGHT) rightkey = true;
  if (key == 'w' || key == 'W') wkey = true;
  if (key == 'e' || key == 'E') ekey = true;
  if (key == 'd' || key == 'D') dkey = true;
  if (key == 'a' || key == 'a') akey = true;
  if (key == 'b' || key == 'B') bkey = true;
  if (key == 'f' || key == 'F') fkey = true;
 if (key == 'p' || key == 'P') pkey = true;
 if (key == 'o' || key == 'O') okey = true;
  if (key == 'h' || key == 'H') hkey = true;
 if (key == 'k' || key == 'K') kkey = true;
 if (key == 'g' || key == 'G') gkey = true;
  if (key == ' ' || key == ' ') spacekey = true;
  if (keyCode == UP) upkey = true;
  //if (keyCode == DOWN) downkey = true;
  if (keyCode == LEFT) leftkey = true;
  if (keyCode == RIGHT) rightkey = true;
  if (keyCode == SHIFT) shiftkey = true;
}

void keyReleased() {
  //if (keyCode == UP) upkey = false;
  //if (keyCode == DOWN) downkey = false;
  //if (keyCode == LEFT) leftkey = false;
  //if (keyCode == RIGHT) rightkey = false;
  if (key == 'w'|| key  == 'W') wkey = false;
 if (key == 'e'|| key  == 'E') wkey = false;
  //if (key == 's') skey = false;
  if (key == 'd'|| key == 'D') dkey = false;
  if (key == 'a'|| key == 'A') akey = false;
   if (key == 'b'|| key == 'B') bkey = false;
    if (key == 'f' || key == 'F') fkey = false;
     if (key == 'p' || key == 'P') pkey = false;
     if (key == 'o' || key == 'O') okey = false;
      if (key == 'h' || key == 'H') hkey = false;
 if (key == 'k' || key == 'K') kkey = false;
  if (key == ' ' || key == ' ') spacekey = false;
  if (key == 'g' || key == 'G') gkey = false;
      if (keyCode == UP) upkey = false;
 // if (keyCode == DOWN) downkey = false;
  if (keyCode == LEFT) leftkey = false;
  if (keyCode == RIGHT) rightkey = false;
    if (keyCode == SHIFT) shiftkey = false;
}
