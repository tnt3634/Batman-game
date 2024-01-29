class FDoor2 extends FGameObject {


  FDoor2(float x, float y) {
    super();
    setPosition(x, y);
    setName("door2");
    attachImage(doorF);
    setStatic(true);
    setFriction(4);
  }

  void act() {
    
    if (isTouching("player")) {      
      println("!");
      map1 = false;
      loadWorld(finale);
      loadPlayer();
    }
  } 
}
