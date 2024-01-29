class FScarecrow extends FGameObject {




  FBox scbullet;
  int scareMode;
  int frame = 0;
  int direction = L;
  int speed = 200;
  int cooldown = 60;


  final int rest = 2;
  final int crawl = 1;
  final int gas = 3;
  final int welcome = 4;
  FScarecrow(float x, float y) {
    super();
    //float vy = getVelocityY();
    //float vx = getVelocityX();

    setPosition(x, y);
    setName("scarecrow");
    setRotatable(false);
    setSensor(false);
    setStatic(true);
    scareMode = rest;
    ogY = y;
    attachImage(scCart);
  }

  void act() {
    animate();
    collide();
    move();
    shoot();
    if (hearts1 == true) {
      image(heart1, 50, 300);
    }
    if (hearts2 == true) {
      image(heart2, 75, 300);
    }
  }

  void move() {
  }

  void animate() {

    
    if (bossMode == true){
      scareMode = rest;
      
    } else{
      scareMode = crawl;
    }
    //float vy = getVelocityY();
    //float vx = getVelocityX();

    if (scareMode == rest) {
      setStatic(false);
      attachImage(scCart);
      setPosition(getX(), ogY);
      setVelocity(speed*direction, ogY);
    }
    if (scareMode == crawl) {
      setStatic(false);
      attachImage(scCrawl);
    }

    //    if (scareMode == gas) {
    //      setStatic(false);
    //attachImage(tSleep);
    //      setPosition(getX(), getY()-50);
    //    }
    if (scareMode == welcome) {

      image(scMessage, 50, 50);
    }
  }

  void shoot() {
    cooldown--;
    FSCBullet scbu = new FSCBullet();
    scbu.setPosition(getX(), getY() -33);
    scbu.setVelocity(0, 20);
    scbu.setSensor(true);
    scbu.setVelocity(random(0, -900), scbu.getVelocityY());


    if ((cooldown == 0)&&(bossMode == true)) {
      enemies.add(scbu);
      world.add(scbu);

      cooldown = 50;
    }
  }

  void collide() {


    if (isTouching("player")) {
    // pickedup = true;

      enemies.remove(this);
      world.remove(this);
    }
    if (isTouching("mblock") || isTouching("blueBrick")) {
      direction *= -1;
      //setPosition(getX()+direction, ogY);
    }
    //if(isTouching("blueBrick.png"));{

    //  direction *= -1;
    //}
  }
}
