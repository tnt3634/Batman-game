class FGDoor extends FGameObject {


  FGDoor(float x, float y) {
    super(1);
    setPosition(x, y);
    setName("guardDoor");
    attachImage(guardDoor);
    setStatic(true);
    setFriction(4);
  }

  void act() {
    
    if (isTouching("player")) {      
      println("!");
      map1 = false;
      psp = false;
      hearts1 = true;
      hearts2 = true;
      bossMode = true;
      loadWorld(bossMap);
      playerEnter = true;
      world.add(scarecrow);
      scTheme.pause();
      scFight.play();
      loadPlayer();
    }
  } 
}
