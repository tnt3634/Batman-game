class FShip extends FGameObject {


  FShip(float x, float y) {
    super();
    setPosition(x, y);
    setName("ship");
    attachImage(sship);
    setStatic(true);
    setFriction(4);
  }

  void act() {
    
    if (isTouching("player")) {      
     holding = false;
      color(black);
     textFont(batmanF);
     textSize(10);
     text("press e to enter", 180, 200);
    }
  } 
}
