class FBullet extends FGameObject{
int direction;
FBullet(){
   
  
  
    float vy = getVelocityY();
   // float vx = getVelocityX();
    
    setRotatable(false);
    setSensor(true);
    setFillColor(white);
    setStatic(false);
    setVelocity(400, vy);
    setName("bullet");
    direction = L;
    attachImage(bullet);
  
}

void act(){
 
  if(isTouching("brick")){
    world.remove(this);
    enemies.remove(this);
    
  }
  
}



    
    
    
}
