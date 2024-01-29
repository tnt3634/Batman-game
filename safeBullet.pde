class FSbul extends FGameObject{
int direction;
FSbul(){
   
  
  
    float vy = getVelocityY();
    float vx = getVelocityX();
    
    attachImage(batarang);
    setRotatable(true);
    setFillColor(white);

    setVelocity(vx, vy);
    setName("safebullet");
    
  
}



//    world.add(bullet);
    
    
    
}
