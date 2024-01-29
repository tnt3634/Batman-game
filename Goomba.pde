class FGoomba extends FGameObject {


  int frame = 0;
  int direction = L;
  int speed = 200;

  FGoomba(float x, float y) {
    super();
    setPosition(x, y);
    setName("goomba");
    setRotatable(false);
    creeping = true;
  }

  void act() {
    animate();
    collide();
    move();
  }


  void animate() {
    if (creeping == true){
    if (frame >= goomba.length) frame = 0;
    if (frameCount % 5 == 0) {
      if (direction == L) attachImage(goomba[frame]);
      if (direction == R) attachImage(reverseImage(goomba[frame]));
      frame++;
    }
    } else {
     if (frame >= sleeping.length) frame = 0;
    if (frameCount % 5 == 0) {
      if (direction == L) attachImage(sleeping[frame]);
      if (direction == R) attachImage(reverseImage(sleeping[frame]));
      frame++;
    }
    }
  }


  void collide() {

    if (isTouching("brick")) {
      direction *= -1;
      setPosition(getX()+direction, getY());
    }
    
    if (isTouching("safebullet")) {
    creeping = false;
    }
    if ((isTouching("player"))&&(creeping == true)&&(spacekey)) {
        
        action = hit;
        creeping = false;
      } 
      if ((isTouching("player"))&&(creeping == true)){
        player.setPosition(300, 998);
      }
       if ((isTouching("player"))&&(creeping == false)){
        world.remove(this);
        enemies.remove(this);
      }
      
      
      }
    


  void move() {
if(creeping == true){
    float vy = getVelocityY();
    setVelocity(speed*direction, vy);
}
  }
}
