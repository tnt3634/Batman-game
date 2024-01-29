class FDrone extends FGameObject {



  int frame;
  int direction;




  FDrone() {
    super(1);
    direction = R;
    //setPosition(player.getX(), player.getY());
    //setFillColor(red);
    setRotatable(false);
    frame = 0;
    setName("drone");

    attachImage(bDrone[0]);


    // world.add(feet);
    if (direction == R) {
      facing = true;
    }
    if (direction == L) {
      facing = false;
    }
  }


  void act() {
    animate();
    handleInput();

    if (isTouching("spike")) {
      setPosition(player.getX(), player.getY());
    }
    //float x = getX();
    //float y = getY();
    //feet.setPosition(x, y + 40);
    //feet.setVelocity(getVelocityX(), getVelocityY());
    // ArrayList<FContact> fcontacts = feet.getContacts();
    //if (fcontacts.size() > 2){
    //  canJump = true;
    //} else canJump = false;

    if (isTouching("bullet")) {
      setPosition(player.getX(), player.getY());
    }
    if (isTouching("ahold")) {
    }

    if (isTouching("alinSpwn")) {
      // taken = true;
    }
    if ((isTouching("ship"))&&(ekey)) {
      map1 = false;

      loadWorld(spaceShip);
      world.add(player);
      setPosition(300, 1000);
    }

    if ((isTouching("weirdbox")) && (pkey)) {
      loadWorld(batcave);
      world.add(player);
    }
    if(isTouching("switch")){
      
      aslOpen = true;
    }
  }




  void animate() {

    if (frame >= bDrone.length) frame = 0;
    if (frameCount % 5 == 0) {
      attachImage(bDrone[frame]);
      frame++;
    }
  }



  void handleInput() {

    float vy = getVelocityY();
    float vx = getVelocityX();
    if (abs(vy) < 998) {

      //action = bDrone;
    }
 
 if ((kkey)){
    world.remove(this);
        enemies.remove(this);     
        droneAdd = 0;
 }


    if (leftkey) {

      setVelocity(-200, vy);
     

      direction = L;
    }


    if (rightkey) {
   
      setVelocity(200, vy);
      direction = R;
    }

    if (upkey) {
      setVelocity(vx, -400);
    }
  }
}
