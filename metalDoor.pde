class FMetalDr extends FGameObject{

  int frame = 0;



  FMetalDr(float x, float y) {
    super();
    setPosition(x, y);
    setName("metalDoor");
    setFriction(4);
    
   
  }

  void act() {
    if (isTouching("")) {
      player.setPosition(300, 998);
    }
     if (aslOpen == true){
      
      //println("7");
    }
    
    
    
    if (aslOpen == false){
    setSensor(false);
    setStatic(true);
    attachImage(mDoor);
    } else if(aslOpen == true){      
     setSensor(true);
    setStatic(true);  
     
    attachImage(mDoor2);
    }
   
  }



}
