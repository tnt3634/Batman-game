class FFactdoor extends FGameObject {


  FFactdoor(float x, float y) {
    super();
    setPosition(x, y);
    setName("factent");
    attachImage(doorH);
    setStatic(true);
    setFriction(4);
  }

  void act() {
    
    if (isTouching("player")) {      
      println("!");
      map1 = false;
      loadWorld(fact);
      loadPlayer();
    }
  } 
}
