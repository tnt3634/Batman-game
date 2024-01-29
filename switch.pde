class FSwitch extends FGameObject {


  FSwitch(float x, float y) {
    super(1);
    setPosition(x, y);
    setName("switch");
    setStatic(true);
    setSensor(true);
    setFriction(4);
   
  }

  void act() {
    
    if (isTouching("drone")) {      
  attachImage(switch2);
  aslOpen = true;
  } else {
    attachImage(switch1);
     aslOpen = false;
  }
}
}
