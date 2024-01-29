class FPrisoner extends FGameObject {


  int frame = 0;
  int direction = L;
  int speed = 200;

  FPrisoner(float x, float y) {
    super();
    setPosition(x, y+45);
    setName("Prisoner");
    setRotatable(false);
    
  }

  void act() {
    animate();
    collide();
    move();
  }


  void animate() {
    
    if (frame >= pwalk.length) frame = 0;
    if (frameCount % 5 == 0) {
      if (direction == R) attachImage(pwalk[frame]);
      if (direction == L) attachImage(reverseImage(pwalk[frame]));
      frame++;
    }
    
  }


  void collide() {

    if (isTouching("brick")) {
      direction *= -1.5;
      setPosition(getX()+direction, getY());
    }
    
   
    
  }

  void move() {

    float vy = getVelocityY();
    setVelocity(speed*direction, vy);

  }
}
