class FTramp extends FGameObject {


  int frame = 0;
  int direction = L;
  int speed = 200;

  FTramp(float x, float y) {
    super();
    setPosition(x, y);
    setName("tramp");
    setRotatable(false);
    attachImage(tramp);
  }

  void act() {

    collide();
  }




  void collide() {



    if (isTouching("player")) {
      player.setVelocity(player.getVelocityX(), -1200);
      action = jump;
    }
  }
}
