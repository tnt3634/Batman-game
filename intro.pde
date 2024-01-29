
void intro() {
   
  intromuse.play();
  image(citySL, 0, 0, width, height);
  fill(0, 10);
  noStroke();
  rect(width/2, height/2, width, height);
 textFont(batmanF);
  textSize(100);
  fill(darkishRed);
//myMovie.play();
  //text("Batman", width/2, height * 11/35);
 text("Batman", width/10, height/3);
  textSize(20);
  image(batmanInt, 200, 100);
  color(steel);
  rect(270, 675, 290, 0); //x,y,w,h
  text("Click anywhere to start", width/11, height);

}


void introClicks() {
//SCREEN IS 600 x 400
  if (mouseX > 0) {
    help = true;
  intromuse.pause();
  batmanMuse.play();
    stroke(steel);
  noFill();
  rect(245, 265, 150, 50);
    mode = GAME;
  }
}
