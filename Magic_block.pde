class FMblock extends FGameObject {


  FMblock(float x, float y) {
    super();
    setPosition(x, y);
    setName("mblock");
    attachImage(stone);
    setStatic(true);
    setFriction(4);
  }

  void act() {
    
    if (switched == true) {      
   world.remove(this);
   terrain.remove(this);
    }
  } 
}
