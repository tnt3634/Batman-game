class FSCLava extends FGameObject{

  int frame = 0;



  FSCLava(float x, float y) {
    super();
    setPosition(x, y);
    setName("sclava");
    setFriction(4);
    setSensor(false);
    setStatic(true);
  }

  void act() {
    if (isTouching("player")&&(fill == true)) {
      player.setPosition(300, 998);
    } else {
      
    }
    
     if((hearts2 == true)&&(hearts1 == false)){
      fill = true;
      
    }
    animate();
  }


  void animate() {
    if(fill == true){
     
    if (frame >= sclava.length) frame = 0;
    if (frameCount % 5 == 0) {
      attachImage(sclava[frame]);

      frame++;
    }
    }else if(fill == false){
      
      attachImage(stone);
      //world.remove(this);
      //terrain.remove(this);
    }
    
  }
}
