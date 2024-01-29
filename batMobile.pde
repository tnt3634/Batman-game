class FBatmobile extends FGameObject {


  FBatmobile(float x, float y) {
    super();
    setPosition(x, y);
    setName("batmobile");
    attachImage(batmobile);
    setStatic(true);
    setFriction(4);
  }

  void act() {
    
    if (isTouching("player")) {      
      //println("!");
      map1 = false;
      loadWorld(mSR);
      loadPlayer();
    }
  } 
}
