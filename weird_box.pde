class Fwbox extends FGameObject {


  int frame = 0;
  int direction = L;
  int speed = 200;

  Fwbox(float x, float y) {
    super();
    setPosition(x, y);
    setName("weirdbox");
    setRotatable(true);
    setStatic(true);
    setSensor(true);
  }

  void act() {
    animate();
    
  
  }


  void animate() {
    if (frame >= wBox.length) frame = 0;
    if (frameCount % 5 == 0) {
      if (direction == L) attachImage(wBox[frame]);
      if (direction == R) attachImage(reverseImage(wBox[frame]));
      frame++;
    }
  }


 
}
