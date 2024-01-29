class FDoor1 extends FGameObject {


  FDoor1(float x, float y) {
    super();
    setPosition(x, y);
    setName("door1");
    attachImage(doorF);
    setStatic(true);
    setFriction(4);
  }

  void act() {
    
    if (isTouching("player")) {      
      println("!");
      map1 = false;
      loadWorld(fact2);
      loadPlayer();
    }
  } 
}
