class FDoorR extends FGameObject {


  FDoorR(float x, float y) {
    super();
    setPosition(x, y);
    setName("roofDoor");
    attachImage(doorH);
    setStatic(true);
    setFriction(4);
  }

  void act() {
    
    if (isTouching("player")) {      
      println("!");
      map1 = false;
      loadWorld(smap);
      loadPlayer();
    }
  } 
}
