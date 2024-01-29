class FDoor extends FGameObject {


  FDoor(float x, float y) {
    super();
    setPosition(x, y);
    setName("door");
    attachImage(batmobile);
    setStatic(true);
    setFriction(4);
  }

  void act() {

    if (isTouching("player")) {
      println("!");
      map1 = false;
      if (partTwo == true) {
        psp = true;
        loadWorld(cityGlide);
        loadPlayer();
        gliding = false;
      } else {
        loadWorld(factEnt);
        loadPlayer();
      }
    }
  }
}
