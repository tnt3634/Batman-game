class FInvis extends FGameObject {

  boolean scThemeplay;

  FInvis(float x, float y) {
    super(1);
    setPosition(x, y);
    setName("invis");
    attachImage(invisBlk);
    setStatic(true);
    setFriction(4);
  }

  void act() {
    
    if (isTouching("player")) {      
  scThemeplay = true;
      loadWorld(asylum);
     gliding = false;
      loadPlayer();
      
    }
    
    if (scThemeplay == true){
        scTheme.play();
        batmanMuse.pause();
    }
  } 
}
