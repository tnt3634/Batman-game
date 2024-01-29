class FPlayer extends FGameObject { //<>//


  FBox sbul;
  int frame;
  int direction;
  int cooldown = 60;
  int jcooldown = 50;
  boolean droneSpwn = false;
  boolean newspaper = false;



  FPlayer() {
    super();
    direction = R;
    if (psp == false) {
      setPosition(300, 998);
    } else if (psp == true) {
      setPosition(245, 225);
    }
    //setFillColor(red);
    setRotatable(false);
    frame = 0;
    setName("player");
    setGrabbable(true);



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
      setPosition(300, 998);
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
      setPosition(300, 998);
    }
    if (isTouching("scbullet")) {
      mode = LOSE;
    }
    if (isTouching("ahold")) {
      taken = true;
      holding = true;
    }

    if (isTouching("alinSpwn")) {
      taken = true;
      holding = true;
    }
    if ((isTouching("ship"))&&(ekey)) {
      map1 = false;
      holding = false;
      loadWorld(spaceShip);
      world.add(player);
      setPosition(300, 1000);
    }
    if ((isTouching("scientist"))&&(ekey)) {
      talking = true;
    }
    if ((isTouching("weirdbox")) && (pkey)) {
      loadWorld(batcave);
      world.add(player);
      partTwo = true;
      newspaper = true;

      gliding = true;
    }
    if (isTouching("guardDoor")) {
      playerEnter = true;
    }

    if (isTouching("scarecrow")) {
      pickedup = true;
    }
    if (pickedup == true) {
      color(pink);
      textFont(batmanF);
      textSize(10);
      text("press 'Space' to make arrest", 180, 130);
    }
    if ((pickedup == true)&&(spacekey)){
      
      mode = WIN;
      
    }



    //if(pickedup == true){
    //   action = batPickup;

    //}

    if (playerEnter == true) {
      image(scMessage, 50, 50);
    }
    if ((pkey)) {

      partTwo = true;
    }
    if (bkey) playerEnter = false;
    if (bkey) newspaper = false;
    if (bkey) scNM = false;
    if (bkey) help = false;

    if (newspaper == true) {
      image(tutmes, 400, 50);
      image(nspr, 0, 0);
    }
    if (help == true) {

      image(helpreq, 400, 50);
    }
  }


  void animate() {

    if (frame >= action.length) frame = 0;
    if (frameCount % 4 == 0) {
      if (direction == R) attachImage(action[frame]);
      if (direction == L) attachImage(reverseImage(action[frame]));
      frame++;
    }
  }


  void shoot() {
    cooldown--;
    FSbul sbu = new FSbul();
    sbu.setPosition(getX(), getY() -33);
    if (direction == L) {
      sbu.setVelocity(-2000, 50);
    }
    if (direction == R) {
      sbu.setVelocity(2000, 50);
    }
    sbu.setSensor(true);


    if (cooldown == 0) {
      enemies.add(sbu);
      world.add(sbu);

      cooldown = 30;
    }
  }

  void handleInput() {
    jcooldown--;
    float vy = getVelocityY();
    float vx = getVelocityX();
    if (abs(vy) < 998) {
      if (holding == true) {
        action = hostIdle;
      } else if (pickedup == true) {
        action = batPickup;
      } else {
        action = idle;
      }
    }
    if (droneAdd == 0) {

      droneSpwn = true;
    }
    if ((okey)&&(droneSpwn == true)) {

      drone = new FDrone();
      drone.setPosition(getX(), getY());
      world.add(drone);
      enemies.add(drone);
      println("?");
      droneAdd ++;
    }

    if (droneAdd > 0) {

      droneSpwn = false;
    }
    //if ((gkey)&&(gliding == true)){
    //  action = glide;
    //} else{
    //  action = idle;
    //}




    if (akey) {
      setVelocity(-400, vy);
      if (holding == true) {
        action = hostRun;
      } else if (pickedup == true) {
        action = batPickupwalk;
      } else {
        action = run;
      }


      direction = L;
    }
    if ((spacekey)&&(pickedup == false)) {
      if (holding == true) {
        action = batPunchHold;
      } else {
        action = batPunch;
      }
      punchsound.play();
      punch = true;
      punchsound.rewind();
    }
    if ((fkey)&&(pickedup == false)) {
      shoot();
      if (holding == true) {
        action = hosttoss;
      } else {
        action = toss;
      }
    }

    if (dkey) {
      setVelocity(400, vy);
      if (holding == true) {
        action = hostRun;
      } else if (pickedup == true) {
        action = batPickupwalk;
      } else {
        action = run;
      }
      direction = R;
    }

    if (wkey) {
      setVelocity(vx, -400);
      if (holding == true) {
        action = hostJump;
      } else if (pickedup == true) {
        action = batPickup;
      } else {
        action = jump;
      }
    }

    if ((shiftkey)&&(direction == L)) {
      setVelocity(-800, vy);
    }
    if ((shiftkey)&&(direction == R)) {
      setVelocity(800, vy);
    }

    //if(hkey) gliding = false;
  }
}
