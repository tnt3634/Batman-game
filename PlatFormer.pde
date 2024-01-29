import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.effects.*;
import ddf.minim.signals.*;
import ddf.minim.spi.*;
import ddf.minim.ugens.*;

import processing.video.*;

import fisica.*;

int frame;
boolean map1 = true;
color blue   = #00A2E8;
color brown  = #3B190A;
color green  = color(74, 163, 57);
color red    = color(224, 80, 61);
color yellow = #FFC90E;
color black = #000000;
color white = #FFFFFF;
color darkishRed = #880015;
color grey= #7F7F7F;
color pink = #FFAEC9;
color greenS = #22B14C;
color lilacB = #C8BFE7;
color orangeF = #B97A57;
color cyan = #99D9EA;
color brownB = #38251B;
color blueBounce = #3F48CC;
color lightG = #B5E61D;
color redB = #750012;
color greyB = #C3C3C3;
color paleY = #EFE4B0;
color redish = #EA0B0B;
color orangeB = #FF7F27;
color longB = #53325C;
color turq = #2B6B6B;
color blueT = #27234D;
color blueA = #71E6E6;
color salmon = #EA7777;
color moss = #454D2A;
color blueAlien = #7092BE;
color purpleA = #39107B;
color blueA2 = #00023D;
color pinkWall = #EA3FF7;
color pinkMid = #4B144F;
color pinkWindow = #852121;
color spaceB = #5D9FC3;
color salmonH = #FF2D8E;
color indigo = #5356C3;
color brick = #542F2F;
color olive = #465941;
color darkPurp = #7111B1;
color caveW = #1F1A42;
color mud = #784315; 
color purpdoor = #360854;
color steel = #141921;
color techGr = #182E07;
color purpledark = #5D3563;
color lichen = #2D3833;
color lime = #D1E785;
color teal = #41BEAD;
color lavander = #D87FFF;
color lightOrange = #FF6B38;
color oRed = #EA1519;
color gold = #FFE222;
color ice = #86B1BE;
color skyBlue = #80F0FF;
color neonGreen = #75FA8D;
color lightgrey = #545454;
color shrek = #3B4019;
color smb = #1300EA;
color imRed = #BA0F12;
boolean psp;
int x2;
int x1 = 900;
int redScore = 0;
int greenScore = 0;
int droneAdd = 0;
int n;
float ogY;
boolean taken;
boolean wkey, akey, dkey, ekey, bkey, fkey, pkey, okey, upkey, rightkey, leftkey, shiftkey, hkey, kkey, gkey, spacekey;
boolean canJump = false;
boolean holding;
boolean talking;
boolean facing;
boolean partTwo = false;
boolean creeping;
boolean playerEnter = false;
boolean aslOpen = false;
boolean gliding = false;
boolean punch;
boolean sc;
boolean fill;
boolean hearts1;
boolean hearts2;
boolean shooterLeft;
boolean scNM;
boolean switched;
boolean pickedup;
boolean bossMode;
boolean help;
boolean tutmess;

ArrayList<FGameObject> terrain;
ArrayList<FGameObject> enemies;
//terrain image
PImage stoneW, railing, test, blueB, stone, bg, map, doorH, fact, spike, bridge, zap1, factWall, bBrick, cityBG, backB, tramp, fact2, doorF, nspr, bossMap, scMessage, invisBlk;
PImage batmobile, mSR, backG, road, blackB, blueL, bullet, finale, thwomp, ahold, sship, smap, tSleep, shipW, shipP, spaceShip, mDoor, mDoor2, guardDoor, scRail, scCart, cityRail;
PImage shipWall, shipMid, shipWindow, space, hallway, testT, gothback, cityStreet, batarang, batcave, caveWall, tech, factEnt, sharp, batComp, tMad, asylumWall, asylum, switch1;
PImage switch2, cityGlide, heart1, heart2, generator, generator1, scmessage2, scCapture, scCrawl, batmanInt, citySL, bossbg, helpreq, tutmes, winpaper;
//character image
PImage[] idle;
PImage[] jump;
PImage[] run;
PImage[] toss;
PImage[] action;
PImage[] zap;
PImage[] goomba;
PImage[] lava;
PImage[] shooter;
PImage[] hit;
PImage[] hostRun;
PImage[] hostJump;
PImage[] hostIdle;
PImage[] hosttoss;
PImage[] sit;
PImage[] talk;
PImage[] wBox;
PImage[] sleeping;
PImage[] pwalk;
PImage[] bDrone;
PImage[] scbomb;
PImage[] batPunch;
PImage[] glide;
PImage[] batPunchHold;
PImage[] batGlide;
PImage[] sclava;
PImage[] batPickup;
PImage[] batPickupwalk;
PImage[] gif;
int f = 0; 
int mode;
final int INTRO = 0;
final int GAME = 1;
final int LOSE = 2;
final int WIN = 3;


//idle = new PImage[2}
//idle[0]
//idle[1]
//idle[2]

PFont batmanF;


int gridSize = 32;
FScarecrow scarecrow;
FPlayer player;
FDrone drone;
FWorld world;
Movie myMovie;
Minim myMinim;

AudioPlayer intromuse;
AudioPlayer punchsound;
AudioPlayer scTheme;
AudioPlayer scFight;
AudioPlayer batmanMuse;
void setup() {

  mode = INTRO;
  myMinim = new Minim(this);
  intromuse = myMinim.loadFile("dannyElf.mp3");
  punchsound = myMinim.loadFile("punchsound.mp3");
  scTheme = myMinim.loadFile("scTheme.mp3");
  scFight = myMinim.loadFile("scFight.mp3");
  batmanMuse = myMinim.loadFile("batmanMuse.mp3");
  size(600, 400);
  Fisica.init(this);
  batmanF = createFont("batmfa.ttf", 100);
  loadImage();
  n = 72;
  gif = new PImage[n];
  // myMovie = new Movie(this, "totoro.mov");

  //textAlign(CENTER, CENTER);



  loadWorld(batcave);

  loadPlayer();
  gif = new PImage[n];


  int i = 0; 
  while( i < n) {
    gif[i] = loadImage("frame_"+i+"_delay-0.03s.gif");
    i++;
  }
  
  //gif[0] = loadImage("frame_00_delay-0.03s.gif");
  //gif[1] = loadImage("frame_01_delay-0.03s.gif");

  //gif[2] = loadImage("frame_02_delay-0.03s.gif");
  //gif[3] = loadImage("frame_03_delay-0.03s.gif");
  //gif[4] = loadImage("frame_04_delay-0.03s.gif");
  //gif[5] = loadImage("frame_05_delay-0.03s.gif");
  //gif[6] = loadImage("frame_06_delay-0.03s.gif");
  //gif[7] = loadImage("frame_07_delay-0.03s.gif");
  //gif[8] = loadImage("frame_08_delay-0.03s.gif");
  //gif[9] = loadImage("frame_09_delay-0.03s.gif");
  //gif[10] = loadImage("frame_10_delay-0.03s.gif");
  //gif[11] = loadImage("frame_11_delay-0.03s.gif");
  //gif[12] = loadImage("frame_12_delay-0.03s.gif");
  //gif[13] = loadImage("frame_13_delay-0.03s.gif");
  //gif[14] = loadImage("frame_14_delay-0.03s.gif");
  //gif[15] = loadImage("frame_15_delay-0.03s.gif");
  //gif[16] = loadImage("frame_16_delay-0.03s.gif");
  //gif[17] = loadImage("frame_17_delay-0.03s.gif");
  //gif[18] = loadImage("frame_18_delay-0.03s.gif");

  //gif[19] = loadImage("frame_19_delay-0.03s.gif");
  //gif[20] = loadImage("frame_20_delay-0.03s.gif");
  //gif[21] = loadImage("frame_21_delay-0.03s.gif");
  //gif[22] = loadImage("frame_22_delay-0.03s.gif");
  //gif[23] = loadImage("frame_23_delay-0.03s.gif");
















  //load actions;
  goomba = new PImage[2];
  goomba[0] = loadImage("knifethug.png");
  goomba[0].resize(11/5*gridSize, 11/4*gridSize);
  goomba[1] = loadImage("knifethug (2).png");
  goomba[1].resize(11/5*gridSize, 11/4*gridSize);

  sleeping = new PImage[1];
  sleeping[0] = loadImage("knifethugSleeping.png");
  // sleeping[0].resize(11/5*gridSize, 11/4*gridSize);

  idle = new PImage[4];
  idle[0] = loadImage("Idle.png");
  idle[1] = loadImage("Idle.png");
  idle[2] = loadImage("Idle (2).png");
  idle[3] = loadImage("Idle (2).png");

  jump = new PImage[5];
  jump[0] = loadImage("Batjump0.png");
  jump[1] = loadImage("Batjump1.png");
  jump[2] = loadImage("Batjump2.png");
  jump[3] = loadImage("Batjump3.png");
  jump[4] = loadImage("Batjump4.png");


  run = new PImage[4];
  //run[0] = loadImage("Batwalk0.png");
  run[0] = loadImage("Batwalk1.png");
  run[1] = loadImage("Batwalk2.png");
  run[2] = loadImage("Batwalk3.png");
  //run[4] = loadImage("Batwalk4.png");
  run[3] = loadImage("Batwalk5.png");


  toss = new PImage[6];

  toss[0] = loadImage("batThrow1.png");
  toss[1] = loadImage("batThrow1.png");
  toss[2] = loadImage("batThrow2.png");
  toss[3] = loadImage("batThrow2.png");
  toss[4] = loadImage("batThrow3.png");
  toss[5] = loadImage("batThrow3.png");


  hit = new PImage[2];

  hit[0] = loadImage("punchjump (2).png");
  hit[1] = loadImage("punchjump(3).png");

  batGlide = new PImage[2];
  batGlide[0] = loadImage("batGlide1.png");
  batGlide[1] = loadImage("batGlide1.png");

  scbomb = new PImage[2];

  scbomb[0] = loadImage("smokebomb.png");
  scbomb[1] = loadImage("smokebomb1.png");

  lava = new PImage[6];

  lava[0] = loadImage("lava0.png");
  lava[0].resize(gridSize, gridSize);
  lava[1] = loadImage("lava1.png");
  lava[1].resize(gridSize, gridSize);
  lava[2] = loadImage("lava2.png");
  lava[2].resize(gridSize, gridSize);
  lava[3] = loadImage("lava3 - Copy.png");
  lava[3].resize(gridSize, gridSize);
  lava[4] = loadImage("lava4 - Copy.png");
  lava[4].resize(gridSize, gridSize);
  lava[5] = loadImage("lava5 - Copy.png");
  lava[5].resize(gridSize, gridSize);

  sclava = new PImage[6];

  sclava[0] = loadImage("lava0.png");
  sclava[0].resize(gridSize, gridSize);
  sclava[1] = loadImage("lava1.png");
  sclava[1].resize(gridSize, gridSize);
  sclava[2] = loadImage("lava2.png");
  sclava[2].resize(gridSize, gridSize);
  sclava[3] = loadImage("lava3 - Copy.png");
  sclava[3].resize(gridSize, gridSize);
  sclava[4] = loadImage("lava4 - Copy.png");
  sclava[4].resize(gridSize, gridSize);
  sclava[5] = loadImage("lava5 - Copy.png");
  sclava[5].resize(gridSize, gridSize);

  shooter = new PImage[9];


  shooter[0] = loadImage("Baz1.png");
  shooter[1] = loadImage("Baz1.png");
  shooter[2] = loadImage("Baz1.png");
  shooter[3] = loadImage("Baz2.png");
  shooter[4] = loadImage("Baz2.png");
  shooter[5] = loadImage("Baz2.png");
  shooter[6] = loadImage("Baz3.png");
  shooter[7] = loadImage("Baz3.png");
  shooter[8] = loadImage("Baz3.png");


  hostRun = new PImage[4];
  //run[0] = loadImage("Batwalk0.png");
  hostRun[0] = loadImage("Batwalk1 - Copy.png");
  hostRun[1] = loadImage("Batwalk2 - Copy.png");
  hostRun[2] = loadImage("Batwalk3 - Copy.png");
  //run[4] = loadImage("Batwalk4.png");
  hostRun[3] = loadImage("Batwalk5 - Copy.png");


  hostJump = new PImage[10];
  hostJump[0] = loadImage("Batjump0 - Copy.png");
  hostJump[0] = loadImage("Batjump0 - Copy.png");
  hostJump[1] = loadImage("Batjump1 - Copy.png");
  hostJump[1] = loadImage("Batjump1 - Copy.png");
  hostJump[2] = loadImage("Batjump2 - Copy.png");
  hostJump[2] = loadImage("Batjump2 - Copy.png");
  hostJump[3] = loadImage("Batjump3 - Copy.png");
  hostJump[3] = loadImage("Batjump3 - Copy.png");
  hostJump[4] = loadImage("Batjump4 - Copy.png");
  hostJump[4] = loadImage("Batjump4 - Copy.png");


  hostIdle = new PImage[4];
  hostIdle[0] = loadImage("Idle - Copy.png");
  hostIdle[1] = loadImage("Idle - Copy.png");
  hostIdle[2] = loadImage("Idle (2) - Copy.png");
  hostIdle[3] = loadImage("Idle (2) - Copy.png");

  hosttoss = new PImage[6];

  hosttoss[0] = loadImage("batThrow1 - Copy.png");
  hosttoss[1] = loadImage("batThrow1 - Copy.png");
  hosttoss[2] = loadImage("batThrow2 - Copy.png");
  hosttoss[3] = loadImage("batThrow2 - Copy.png");
  hosttoss[4] = loadImage("batThrow3 - Copy.png");
  hosttoss[5] = loadImage("batThrow3 - Copy.png");


  pwalk = new PImage[8];

  pwalk[0] = loadImage("Prisoner1.png");
  pwalk[1] = loadImage("Prisoner2.png");
  pwalk[2] = loadImage("Prisoner3.png");
  pwalk[3] = loadImage("Prisoner4.png");
  pwalk[4] = loadImage("Prisoner5.png");
  pwalk[5] = loadImage("Prisoner6.png");
  pwalk[6] = loadImage("Prisoner7.png");
  pwalk[7] = loadImage("Prisoner8.png");


  batPunch = new PImage[4];
  batPunch[0] = loadImage("batPunch.png");
  batPunch[1] = loadImage("batPunch.png");
  batPunch[2] = loadImage("Idle.png");
  batPunch[3] = loadImage("Idle.png");

  batPunchHold = new PImage[4];
  batPunchHold[0] = loadImage("batPunchHold.png");
  batPunchHold[1] = loadImage("batPunchHold.png");
  batPunchHold[2] = loadImage("batPunchHold.png");
  batPunchHold[3] = loadImage("batPunchHold.png");


  wBox = new PImage[4];
  wBox[0] = loadImage("wBox.png");
  wBox[1] = loadImage("wBox1.png");
  wBox[2] = loadImage("wBox2.png");
  wBox[3] = loadImage("wBox3.png");

  talk = new PImage[2];
  talk[0] = loadImage("scientist.png");
  talk[1] = loadImage("scientist1.png");

  sit = new PImage[1];
  sit[0] = loadImage("scientistSitting.png");

  bDrone = new PImage[1];
  bDrone[0] = loadImage("bDrone.png");

  batPickup = new PImage[1];
  batPickup[0] = loadImage("batscpickup.png");

  batPickupwalk = new PImage[2];
  batPickup[0] = loadImage("batscpickup.png");
  batPickupwalk[1] = loadImage("batscpickup2.png");
  //bDrone[0].resize(gridSize/3/2, gridSize/65/25);


  action = idle;

  //mode = INTRO;
}
void loadImage() {

  bg = loadImage("dark-city-futuristic-cyber-city-wallpaper-thumb.jpg");
  map = loadImage("citymap1.png");
  stone = loadImage("brick.png");
  blueB = loadImage("blueBlock.png");
  test = loadImage("test.png");
  stoneW = loadImage("stoneWS.png");
  railing = loadImage("railmid.png");
  doorH = loadImage("doorhouse.png");
  fact = loadImage("factory1.png");
  spike = loadImage("water1.png");
  bridge = loadImage("catWalkN.png");
  zap1 = loadImage("zap.png");
  factWall = loadImage("factWall.png");
  bBrick = loadImage("blueBrick.png");
  cityBG = loadImage("cityBack5.png");
  backB = loadImage("brickOther.png");
  tramp = loadImage("tramp.png");
  fact2 = loadImage("factory2.png");
  doorF = loadImage("doorF.png");
  batmobile = loadImage("batmobile.png");
  mSR = loadImage("mapSewer.png");
  backG = loadImage("newCityback.png");
  // backG = loadImage("grossBack.png");
  road = loadImage("roadAhead.png");
  blackB = loadImage ("black.png");
  blueL = loadImage("longWall.png");
  bullet = loadImage("bullet2.png");
  finale = loadImage("Finale.png");
  thwomp = loadImage("thwomp0.png");
  ahold = loadImage("ahold.png");
  sship = loadImage("homeShip.png");
  smap = loadImage("shipReturn.png");
  tSleep = loadImage("thwomp0.png");
  shipW = loadImage("shipWall.png");
  shipP = loadImage("shipPillar.png");
  spaceShip = loadImage("spaceShip.png");
  shipWall = loadImage("shipFloor.png");
  shipMid = loadImage("shipMid.png");
  shipWindow = loadImage("shipWindow.png");
  space = loadImage("space.png");
  hallway = loadImage("hallway.png");
  testT = loadImage("testT.png");
  gothback = loadImage("gothambackround.png");
  cityStreet = loadImage("cityStreet.png");
  batarang = loadImage("batarang.png");
  batcave = loadImage("batCave1.png");
  caveWall = loadImage("batCave.png");
  tech = loadImage("techStuff.png");
  factEnt = loadImage("factEnt.png");
  sharp = loadImage("sharp.png");
  batComp = loadImage("batComp.png");
  tMad = loadImage("thwomp1.png");
  asylumWall = loadImage("aasylumWall.png");
  asylum = loadImage("arkhamAsylum.png");
  switch1 = loadImage("switch.png");
  switch2 = loadImage("switch2.png");
  mDoor = loadImage("mDoor.png");
  mDoor2 = loadImage("mDoor2.png");
  guardDoor = loadImage("guardDoor.png");
  nspr = loadImage("gothamNewspaper.png");
  bossMap = loadImage("bossMap.png");
  scMessage = loadImage("scMessage.png");
  scRail = loadImage("scRail.png");
  scCart = loadImage("scCart.png");
  cityRail = loadImage("cityrail.png");
  cityGlide = loadImage("glideMap.png");
  invisBlk = loadImage("invisBlk.png");
  heart1 = loadImage("heart1.png");
  heart2 = loadImage("heart2.png");
  generator = loadImage("generator.png");
  generator1 = loadImage("generator1.png");
  scmessage2 = loadImage("scMessage2.png");
  scCapture = loadImage("scCapture.png");
  scCrawl = loadImage("scarecrowcrawl.png");
  batmanInt = loadImage("batmanInt.png");
  citySL = loadImage("citySL.png");
  bossbg = loadImage("bossbg.png");
  helpreq = loadImage("helpReq.png");
  tutmes = loadImage("tutmes.png");
  winpaper = loadImage("gothamNewspaperWin.png");
}
void loadWorld (PImage img) {

  world = new FWorld(-2000, -2000, 2000, 2000);
  if (gliding == false) {
    world.setGravity(0, 1900);
  } else if (gliding == true) {
    println("4");
    world.setGravity(0, 300);
  }
  terrain = new ArrayList<FGameObject>();
  enemies = new ArrayList<FGameObject>();

  for (int y = 0; y < img.height; y++) {
    for (int x = 0; x < img.width; x++) {
      color c = img.get(x, y);
      if (c == black) {

        FBox b = new FBox(gridSize, gridSize);
        b.setPosition(x*gridSize, y*gridSize);
        b.setStatic(true);
        b.attachImage(stone);
        b.setName("brick");
        world.add(b);
        b.setFriction(35);
      }
      if (c == greenS) {


        FLava l = new FLava(x*gridSize, y*gridSize);
        terrain.add(l);
        world.add(l);
      }
      if (c == skyBlue) {


        FSCLava scl = new FSCLava(x*gridSize, y*gridSize);
        terrain.add(scl);
        world.add(scl);
      }
      if (c == lime) {


        FSwitch sw = new FSwitch(x*gridSize, y*gridSize);
        terrain.add(sw);
        world.add(sw);
      }
      if (c == teal) {


        FMetalDr md = new FMetalDr(x*gridSize, y*gridSize);
        terrain.add(md);
        world.add(md);
      }
      if (c == lichen) {


        FPrisoner pr = new FPrisoner(x*gridSize, y*gridSize);
        enemies.add(pr);
        world.add(pr);
      }


      if (c == oRed) {


        FScarecrow sc = new FScarecrow(x*gridSize, y*gridSize);
        enemies.add(sc);
        world.add(sc);
      }

      if (c == neonGreen) {
        FGener gnr =  new FGener(x*gridSize, y*gridSize);
        terrain.add(gnr);
        world.add(gnr);
      }
      if (c == lightgrey) {
        FMblock mb =  new FMblock(x*gridSize, y*gridSize);
        terrain.add(mb);
        world.add(mb);
      }


      if (c == gold) {


        FInvis inv = new FInvis(x*gridSize, y*gridSize);
        terrain.add(inv);
        world.add(inv);
      }


      if (c == lavander) {


        FGDoor gd = new FGDoor(x*gridSize, y*gridSize);
        enemies.add(gd);
        world.add(gd);
      }
      if (c == purpdoor) {


        FFactdoor fd = new FFactdoor(x*gridSize, y*gridSize);
        terrain.add(fd);
        world.add(fd);
      }
      if (c == blue) {

        FBox b = new FBox(gridSize, gridSize);
        b.setPosition(x*gridSize, y*gridSize);
        b.setStatic(true);
        b.setName("blue");
        world.add(b);
      }

      if (c == brown) {

        FBox b = new FBox(gridSize, gridSize);
        b.setPosition(x*gridSize, y*gridSize);
        b.setStatic(true);
        b.setSensor(true);
        b.attachImage(test);
        b.setName("test");
        world.add(b);
      }
      if (c == mud) {

        FBox b = new FBox(gridSize, gridSize);
        b.setPosition(x*gridSize, y*gridSize);
        b.setStatic(true);
        b.setSensor(true);
        b.attachImage(tech);
        b.setName("tech");
        world.add(b);
      }
      if (c == ice) {

        FBox b = new FBox(gridSize, gridSize);
        b.setPosition(x*gridSize, y*gridSize);
        b.setStatic(true);
        b.setSensor(true);
        b.attachImage(cityRail);
        b.setName("cityRail");
        world.add(b);
      }
      if (c == imRed) {

        FBox b = new FBox(gridSize, gridSize);
        b.setPosition(x*gridSize, y*gridSize);
        b.setStatic(true);
        b.setSensor(true);
        b.attachImage(bossbg);
        b.setName("bossbg");
        world.add(b);
      }
      if (c == purpledark) {

        FBox b = new FBox(gridSize, gridSize);
        b.setPosition(x*gridSize, y*gridSize);
        b.setStatic(true);
        b.setSensor(true);
        b.attachImage(asylumWall);
        b.setName("asylumwall");
        world.add(b);
      }
      if (c == lightOrange) {

        FBox b = new FBox(gridSize, gridSize);
        b.setPosition(x*gridSize, y*gridSize);
        b.setStatic(true);
        b.setSensor(true);
        b.attachImage(scRail);
        b.setName("rail");
        world.add(b);
      }

      if (c == darkishRed) {

        FBox b = new FBox(gridSize, gridSize);
        b.setPosition(x*gridSize, y*gridSize);
        b.setStatic(true);
        b.setSensor(true);
        b.attachImage(stoneW);
        b.setName("brickwindow");
        world.add(b);
      }
      if (c == grey) {

        FBox b = new FBox(gridSize, gridSize);
        b.setPosition(x*gridSize, y*gridSize);
        b.setStatic(true);
        b.setSensor(true);
        b.attachImage(railing);
        b.setName("railing");
        world.add(b);
      }
      if (c == techGr) {

        FBox b = new FBox(gridSize, gridSize);
        b.setPosition(x*gridSize, y*gridSize);
        b.setStatic(true);
        b.setSensor(true);
        b.attachImage(batComp);
        b.setName("batComp");
        world.add(b);
      }
      if (c == darkPurp) {

        FBox b = new FBox(gridSize, gridSize);
        b.setPosition(x*gridSize, y*gridSize);
        b.setStatic(true);
        b.setSensor(true);
        b.attachImage(cityStreet);
        b.setName("cityStreet");
        world.add(b);
      }
      if (c == caveW) {

        FBox b = new FBox(gridSize, gridSize);
        b.setPosition(x*gridSize, y*gridSize);
        b.setStatic(true);

        b.attachImage(caveWall);
        b.setName("caveWall");
        world.add(b);
      }
      if (c == pink) {

        FDoor d = new FDoor(x*gridSize, y*gridSize);
        terrain.add(d);
        world.add(d);
      }
      if (c == salmonH) {

        FDoorR rd = new FDoorR(x*gridSize, y*gridSize);
        terrain.add(rd);
        world.add(rd);
      }
      if (c == lilacB) {
        FBridge br = new FBridge(x*gridSize, y*gridSize);
        terrain.add(br);
        world.add(br);
      }
      if (c == orangeF) {

        FBox b = new FBox(gridSize, gridSize);
        b.setPosition(x*gridSize, y*gridSize);
        b.setStatic(true);
        b.setSensor(true);
        b.attachImage(factWall);
        b.setName("factWall");
        world.add(b);
      }
      if (c == brownB) {

        FBox b = new FBox(gridSize, gridSize);
        b.setPosition(x*gridSize, y*gridSize);
        b.setStatic(true);
        b.setSensor(false);
        b.attachImage(bBrick);
        b.setName("blueBrick");
        b.setFriction(35);
        world.add(b);
      }
      if (c == steel) {

        FBox b = new FBox(gridSize, gridSize);
        b.setPosition(x*gridSize, y*gridSize);
        b.setStatic(true);
        b.setSensor(false);
        b.attachImage(sharp);
        b.setName("sharp");
        b.setFriction(35);
        world.add(b);
      }
      if (c == yellow) {

        FGoomba goomba = new FGoomba(x*gridSize, y*gridSize);
        enemies.add(goomba);
        world.add(goomba);
      }
      if (c == brick) {

        FScientist sc = new FScientist(x*gridSize, y*gridSize);
        enemies.add(sc);
        world.add(sc);
      }
      if (c == redB) {

        FShooter shooter = new FShooter(x*gridSize, y*gridSize);
        enemies.add(shooter);
        world.add(shooter);
      }

      if (c == blueBounce) {

        FTramp trp = new FTramp(x*gridSize, y*gridSize);
        enemies.add(trp);
        world.add(trp);
      }

      if (c == cyan) {

        FBox b = new FBox(gridSize, gridSize);
        b.setPosition(x*gridSize, y*gridSize);
        b.setStatic(true);
        b.setSensor(true);
        b.attachImage(backB);
        b.setName("brickBack");
        world.add(b);
      }
      if (c == indigo) {

        FBox b = new FBox(gridSize, gridSize);
        b.setPosition(x*gridSize, y*gridSize);
        b.setStatic(true);
        b.setSensor(true);
        b.attachImage(testT);
        b.setName("testTube");
        world.add(b);
      }
      if (c == lightG) {

        FDoor1 d1 = new FDoor1(x*gridSize, y*gridSize);
        terrain.add(d1);
        world.add(d1);
      }
      if (c == greyB) {

        FBatmobile bm = new FBatmobile(x*gridSize, y*gridSize);
        terrain.add(bm);
        world.add(bm);
      }
      if (c == turq) {

        FDoor2 dt = new FDoor2(x*gridSize, y*gridSize);
        terrain.add(dt);
        world.add(dt);
      }
      if (c == paleY) {

        FBox b = new FBox(gridSize, gridSize);
        b.setPosition(x*gridSize, y*gridSize);
        b.setStatic(true);
        b.setSensor(true);
        b.attachImage(backG);
        b.setName("grossBack");
        world.add(b);
      }
      if (c == redish) {

        FBox b = new FBox(gridSize, gridSize);
        b.setPosition(x*gridSize, y*gridSize);
        b.setStatic(true);
        b.setSensor(true);
        b.attachImage(road);
        b.setName("road");
        world.add(b);
      }
      if (c == orangeB) {

        FBox b = new FBox(gridSize, gridSize);
        b.setPosition(x*gridSize, y*gridSize);
        b.setStatic(true);
        b.setSensor(true);
        b.attachImage(blackB);
        b.setName("black");
        world.add(b);
      }
      if (c == longB) {

        FBox b = new FBox(gridSize, gridSize);
        b.setPosition(x*gridSize, y*gridSize);
        b.setStatic(true);
        b.setSensor(true);
        b.attachImage(blueL);
        b.setName("blueLong");
        world.add(b);
      }
      if (c == blueT) {

        FThwomp twp = new FThwomp(x*gridSize, y*gridSize);
        enemies.add(twp);
        world.add(twp);
      }
      if (c == blueA) {

        FBox b = new FBox(gridSize, gridSize);
        b.setPosition(x*gridSize, y*gridSize);
        b.setStatic(true);
        b.setSensor(true);
        if (taken == false) {
          b.attachImage(ahold);
        } else {
          b.attachImage(thwomp);
        }
        b.setName("ahold");
        world.add(b);
      }
      if (c == salmon) {

        FDoor3 d3 = new FDoor3(x*gridSize, y*gridSize);
        terrain.add(d3);
        world.add(d3);
      }

      if (c == moss) {

        FShip ss = new FShip(x*gridSize, y*gridSize);
        terrain.add(ss);
        world.add(ss);
      }
      if (c == smb) {

        FDoor5 df = new FDoor5(x*gridSize, y*gridSize);
        terrain.add(df);
        world.add(df);
      }
      if (c == shrek) {

        FSwitched swd = new FSwitched(x*gridSize, y*gridSize);
        terrain.add(swd);
        world.add(swd);
      }
      if (c == olive) {

        Fwbox wb = new Fwbox(x*gridSize, y*gridSize);
        terrain.add(wb);
        world.add(wb);
      }
      if (c == blueAlien) {

        FBox b = new FBox(gridSize, gridSize);
        b.setPosition(x*gridSize, y*gridSize);
        b.setStatic(true);
        b.setSensor(true);
        b.attachImage(stone);
        b.setName("alinSpwn");
        world.add(b);
      }
      if (c == purpleA) {

        FBox b = new FBox(gridSize, gridSize);
        b.setPosition(x*gridSize, y*gridSize);
        b.setStatic(true);
        b.setSensor(true);
        b.attachImage(shipW);
        b.setName("shipW");
        world.add(b);
      }
      if (c == blueA2) {

        FBox b = new FBox(gridSize, gridSize);
        b.setPosition(x*gridSize, y*gridSize);
        b.setStatic(true);
        b.setSensor(true);
        b.attachImage(shipP);
        b.setName("shipP");
        world.add(b);
      }
      if (c == pinkWall) {

        FBox b = new FBox(gridSize, gridSize);
        b.setPosition(x*gridSize, y*gridSize);
        b.setStatic(true);
        b.setSensor(false);
        b.attachImage(shipWall);
        b.setFriction(35);
        b.setName("shipWall");
        world.add(b);
      }
      if (c == pinkMid) {

        FBox b = new FBox(gridSize, gridSize);
        b.setPosition(x*gridSize, y*gridSize);
        b.setStatic(true);
        b.setSensor(false);
        b.attachImage(shipMid);
        b.setFriction(35);
        b.setName("");
        world.add(b);
      }
      if (c == pinkWindow) {

        FBox b = new FBox(gridSize, gridSize);
        b.setPosition(x*gridSize, y*gridSize);
        b.setStatic(true);
        b.setSensor(true);
        b.attachImage(shipWindow);
        b.setName("");
        world.add(b);
      }
      if (c == spaceB) {

        FBox b = new FBox(gridSize, gridSize);
        b.setPosition(x*gridSize, y*gridSize);
        b.setStatic(true);
        b.setSensor(true);
        b.attachImage(space);
        b.setName("space");
        world.add(b);
      }
    }
  }
}


void loadPlayer() {
  player = new FPlayer();
  world.add(player);
  player.setGrabbable(true);
}

void draw() {

  image(gothback, 0, 0, width, height);
  //println(mouseX);
  //println(mouseY);
  if (mode == INTRO) {
    intro();
  }
  if (mode == LOSE) {
    lose();
  }
  if (mode == WIN){
    win();
  }

  if (mode == GAME) {
    drawWorld();
    actWorld();
  }
}
void movieEvent(Movie m) {
  m.read();
}


void actWorld() {
  player.act();
  for (int i = 0; i < terrain.size(); i++) {
    FGameObject t = terrain.get(i);
    t.act();
  }
  for (int i = 0; i < enemies.size(); i++) {
    FGameObject e = enemies.get(i);
    e.act();
  }
}


void drawWorld() {

  pushMatrix();
  translate (-player.getX()+ width/2, -player.getY()+ height/2);
  scale(1);
  world.step();
  world.draw();
  popMatrix();
}
