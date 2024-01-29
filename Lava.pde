class FLava extends FGameObject{

  int frame = 0;



  FLava(float x, float y) {
    super();
    setPosition(x, y);
    setName("lava");
    setFriction(4);
    setSensor(false);
    setStatic(true);
  }

  void act() {
    if (isTouching("player")) {
      player.setPosition(300, 998);
    }
    animate();
  }


  void animate() {
    if (frame >= lava.length) frame = 0;
    if (frameCount % 5 == 0) {
      attachImage(lava[frame]);

      frame++;
    }
  }
}
