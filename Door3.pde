class FDoor3 extends FGameObject {


  FDoor3(float x, float y) {
    super();
    setPosition(x, y);
    setName("door3");
    attachImage(doorF);
    setStatic(true);
    setFriction(4);
  }

  void act() {
    
    if (isTouching("player")) {      

      loadWorld(hallway);
      loadPlayer();
    }
  } 
}
