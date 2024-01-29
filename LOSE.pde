void lose() {
  if (f == n) {
    f = 0;
  }

  image(gif[f], 0, 0, width, height);
  f++;
  //intromuse.play();
 // image(citySL, 0, 0, width, height);
  fill(0, 10);
  noStroke();
  rect(width/2, height/2, width, height);
  textFont(batmanF);
  textSize(20);
  fill(redish);
  //myMovie.play();
  //text("Batman", width/2, height * 11/35);
  text("you LOSE Batman, Gotham is mine", width/9, 50);
  fill(darkishRed);
  textSize(20);
//  image(batmanInt, 200, 100);
  color(steel);
  rect(270, 675, 290, 0); //x,y,w,h
  text("Click anywhere to retry", 120, height);
}


void loseClicks() {
  //SCREEN IS 600 x 400
  if (mouseX > 0) {

    scTheme.play();
    batmanMuse.pause();
    mode = GAME;
    loadWorld(asylum);
    loadPlayer();
  }
}
