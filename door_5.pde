class FDoor5 extends FGameObject {


  FDoor5(float x, float y) {
    super();
    setPosition(x, y);
    setName("door5");
    attachImage(guardDoor);
    setStatic(true);
    setFriction(4);
    
  }

  void act() {
    
    
    if (isTouching("player")) {      
      hearts1 = false;
      hearts2 = false;
      loadWorld(scCapture);
      loadPlayer();
      bossMode = false;
      scFight.pause();
      batmanMuse.play();
    }
  } 
}
