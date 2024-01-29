class FShooter extends FGameObject {


  int frame = 0;
  int direction = L;
  int speed = 200;
   int cooldown = 60; 
 FBox bullet; 

  FShooter(float x, float y) {  
    super();
    //float vy = getVelocityY();
    //float vx = getVelocityX();
    setPosition(x, y);
    setName("shooter");
    setRotatable(false);
    shooterLeft = true;
  }

  void act() {
    animate();
    collide();
    move();
    shoot();
    bullet();

  }


  void animate() {
    if (frame >= shooter.length) frame = 0;
    if (frameCount % 5 == 0) {
      if (direction == R) attachImage(shooter[frame]);
      if (direction == L) attachImage(reverseImage(shooter[frame]));
      frame++;
    }
  }

  void shoot(){
    cooldown--;
    FBullet bu = new FBullet();
    bu.setPosition(getX(),getY() -33);
    bu.setVelocity(-800, 20);
    bu.setSensor(true);
    if (shooterLeft == true){
    bu.setVelocity(-800, bu.getVelocityY());
    } else if (shooterLeft == false){
        bu.setVelocity(800, bu.getVelocityY());
    }
    if (cooldown == 0) {
        enemies.add(bu);
    world.add(bu);
    
      cooldown = 50;
  }
  }
  
  void collide() {

    if (player.getX() > getX()-gridSize) {
      shooterLeft = false;
      direction = R;
    } else if (player.getX() > getX()-gridSize) {
      shooterLeft = true;
      direction = L; 
    }
    
    
    if (isTouching("brick")) {
      direction *= -1;
      setPosition(getX()+direction, getY());
    }
     if (isTouching("safebullet")) {
       world.remove(this);
        enemies.remove(this);       
    }
    if (isTouching("player")) {
      if (player.getY() < getY()-gridSize) {
        world.remove(this);
        enemies.remove(this);
      } else {
        player.setPosition(1000, 5);
      }
    }
  }

  void move() {

    //float vy = getVelocityY();
    //setVelocity(speed*direction, vy);
  }
  void bullet(){ 
    
    

  }
}
