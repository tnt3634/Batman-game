class FThwomp extends FGameObject {

  int thwompMode;
  int frame = 0;
  int direction = L;
  int speed = 200;
  int cooldown = 60;

  final int fall = 2;
  final int sleepy = 1;
  final int rise = 3;
  FThwomp(float x, float y) {
    super();
    //float vy = getVelocityY();
    //float vx = getVelocityX();
    attachImage(thwomp);
    setPosition(x, y);
    setName("thwomp");
    setRotatable(false);
    setStatic(true);
    thwompMode = sleepy;
  }

  void act() {
    animate();
    collide();
    move();
  }

  void move() {
 
    
    
  }

  void animate() {

    if (thwompMode == sleepy) {
      setStatic(true);
      attachImage(tSleep);
    }
    if (thwompMode == fall) {
      setStatic(false);
      attachImage(tMad);
    }

    if (thwompMode == rise) {
      setStatic(false);
attachImage(tSleep);
      setPosition(getX(), getY()-50);
    }
    //if (frame >= thwomp.length) frame = 0;
    //if (frameCount % 5 == 0) {
    //  if (direction == R) attachImage(thwomp[frame]);
    //  if (direction == L) attachImage(reverseImage(thwomp[frame]));
    //  frame++;
    //}
  }



  void collide() {


    if (isTouching("player")) {
      player.setPosition(300, 998);
    }
    if ((player.getY() > getY()-gridSize && player.getX() < getX()+gridSize && player.getX() > getX()-gridSize)&&(thwompMode == sleepy)){
      thwompMode = fall;
      setVelocity(0, 150);
    }
    if (isTouching("blueBrick")) {
      thwompMode = rise;
    }
    if (isTouching("brick")) {
      thwompMode = sleepy;
      setPosition(getX(), getY() + 2);
    }
  }
}
