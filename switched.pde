class FSwitched extends FGameObject {


  FSwitched(float x, float y) {
    super(1);
    setPosition(x, y);
    setName("switched");
    setStatic(true);
    setSensor(true);
    setFriction(4);
    attachImage(switch1);
  }

  void act() {
    
    if (isTouching("player")&&(fill == true)) {      
  attachImage(switch2);
  aslOpen = true;
  switched = true;
  hearts2 = false;
  } 
}
}
