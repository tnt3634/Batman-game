class FScientist extends FGameObject {


  int frame = 0;
  int direction = L;
  int speed = 200;
  boolean asking;

  FScientist(float x, float y) {
    super();
    setPosition(x, y);
    setName("scientist");
   
    setRotatable(false);

  }

  void act() {
    animate();
    collide();
    move();
     if (isTouching("player")) {      
     holding = false;
     asking = true;
    }
    
    if (asking == true){
      
     color(black);
     textFont(batmanF);
     textSize(10);
     text("press e to speak", 180, 200); 
      
    }
    if (talking == true){
      color(black);
     textFont(batmanF);
     asking = false;
     textSize(10);
     text("Much appreciation mr Batman! I really needed my alien", 180, 180);
     text("As a gift I give you a drone, to return press P by box", 180, 200);
      textSize(7);
     text("press B to continue", 180, 210);
     strokeWeight(7);
     stroke(black);
     noFill();
      rect(170, 185, 410, 30);
    }
    if ((talking == true) && (bkey)) {
    talking = false;
  }
  }


  void animate() {
    
    if (talking == true){
    if (frame >= talk.length) frame = 0;
    if (frameCount % 10 == 0) {
      if (direction == L) attachImage(talk[frame]);
      if (direction == R) attachImage(reverseImage(talk[frame]));
      frame++;
    }
    } else{
      if (frame >= sit.length) frame = 0;
    if (frameCount % 10 == 0) {
      if (direction == L) attachImage(sit[frame]);
      if (direction == R) attachImage(reverseImage(sit[frame]));
      frame++;
    }
    }
    
  }


  void collide() {

    if (isTouching("brick")) {
      direction *= -1;
      setPosition(getX()+direction, getY());
    }
    if (isTouching("player")) {
    
        
 
        
      }
    }
  

  void move() {

    
  }
}
