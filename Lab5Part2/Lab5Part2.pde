PImage zookaImage; //<>//
PImage sleepImage;
PImage boomImage;
PImage bombImage;
color textColor;

Player thePlayer;
Alien badZookas[];
ArrayList<Bullet> bullets = new ArrayList<Bullet>();
Bomb daBomb;

int recoil;
int spawn_x, spawn_y;

boolean gameOver = false;
boolean scatterOn = false;
boolean autofireOn = false;
boolean calming = false;

void settings() {
  size(SCREENX, SCREENY);
}

void setup() {
  PFont gameFont = loadFont("ComicSansMS-48.vlw");
  textFont(gameFont);
  textColor = color(255, 0, 0);
  zookaImage = loadImage("spacer.gif");
  sleepImage = loadImage("calmDown.gif");
  boomImage = loadImage("exploding.gif");
  bombImage = loadImage("bomb.gif");
  badZookas = new Alien[10];
  init_aliens(badZookas, zookaImage, boomImage);
  thePlayer = new Player(SCREENY-MARGIN-PADDLEHEIGHT);
  daBomb = new Bomb(bombImage, SCREENX/2, SCREENY/2);
  recoil = 0;
  noStroke();
}

void init_aliens (Alien[] array, PImage imageAlive, PImage imageBoom) {
  int x = FIRSTX;

  for (int i = 0; i < array.length; i++) {
    array[i] = new Alien(x, FIRSTY, imageAlive, imageBoom);
    x += 50;
  }
}

void move_array(Alien array[]) {
  for (int i = 0; i < array.length; i++) {
    array[i].move();
    array[i].draw();
  }
}

void mousePressed() {
  if (recoil <= 0 && !gameOver) {
    bullets.add(new Bullet(thePlayer.paddleCentre-BULLETWIDTH, thePlayer.ypos));
    if (scatterOn) {
      bullets.add(new Bullet(thePlayer.xpos, thePlayer.ypos));
      bullets.add(new Bullet(thePlayer.xpos+PADDLEWIDTH-BULLETWIDTH, thePlayer.ypos));
    }
    if (autofireOn) recoil = COOLDOWN/2; 
    else recoil = COOLDOWN;
  }
}

void draw() {
  background(#3A243B);
  move_array(badZookas);
  if (daBomb != null) {
    daBomb.move();
    if (!gameOver && !daBomb.offScreen()) {
      gameOver = daBomb.collide(thePlayer);
      daBomb.draw();
    } else daBomb = null;
  }
  /*  if (calming) {
   PowerUps calmDown = new PowerUps(spawn_x, spawn_y, SLOW_ALIENS, sleepImage);
   calming = false;
   } */
  thePlayer.move(mouseX);
  thePlayer.draw();
  for (Bullet b : bullets) {
    b.move();
    b.collide(badZookas);
    if (b.timeToExist > 0) b.draw(); 
    else b = null;
  }
  if (gameOver) {
    fill(textColor);
    text("Game over. You lose.", 50, 250);
  } else if (recoil > 0) recoil--;
}
