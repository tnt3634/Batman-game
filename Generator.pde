class FGener extends FGameObject {

  
  

  FGener(float x, float y) {
    super();
    setPosition(x, y);
    setName("generator");
    attachImage(generator);
    setStatic(true);
    setFriction(4);
  }

  void act() {
    if (scNM == true){
        image(scmessage2, 50, 50);     
      
    }
    if (isTouching("safebullet")) {      
      hearts1 = false;
      attachImage(generator1);
      scNM = true;
    }
  } 
}
