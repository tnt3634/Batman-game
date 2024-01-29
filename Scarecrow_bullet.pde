class FSCBullet extends FGameObject{
int direction;
FSCBullet(){
   
  
  
    float vy = getVelocityY();
   // float vx = getVelocityX();
    
    setRotatable(false);
    setSensor(true);
    setFillColor(white);
    setStatic(false);
    setVelocity(-400, vy);
    setName("scbullet");
    direction = R;
   
  
}

void act(){
 animate();
  if(isTouching("brick")){
    world.remove(this);
    enemies.remove(this);
    
  }
  
}
void animate(){
 if (frame >= scbomb.length) frame = 0;
    if (frameCount % 5 == 0) {
      if (direction == L) attachImage(scbomb[frame]);
      if (direction == R) attachImage(reverseImage(scbomb[frame]));
      frame++;
    }
}
    
    
    
}
