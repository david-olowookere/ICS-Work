PImage zookaImage; //<>// //<>//
PImage sleepImage;
PImage bombImage;
Player thePlayer;
ArrayList<Bullet> bullets = new ArrayList<Bullet>();
Alien badZookas[];
int recoil;
int spawn_x, spawn_y;

boolean scatterOn = false;
boolean autofireOn = false;
boolean calming = false;

void settings() {
  size(SCREENX, SCREENY);
}

void setup() {
  zookaImage = loadImage("spacer.gif");
  sleepImage = loadImage("calmDown.gif");
  bombImage = loadImage("exploding.gif");
  badZookas = new Alien[10];
  init_aliens(badZookas, zookaImage, bombImage);
  thePlayer = new Player(SCREENY-MARGIN-PADDLEHEIGHT);
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
  if (recoil <= 0) {
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
  background(0);
  move_array(badZookas);
  if (calming) {
    PowerUps calmDown = new PowerUps(spawn_x, spawn_y, SLOW_ALIENS, sleepImage);
    calming = false;
  } 
  thePlayer.move(mouseX);
  thePlayer.draw();
  for (Bullet b : bullets) {
    b.move();
    b.collide(badZookas);
    if (b.timeToExist > 0) b.draw(); 
    else b = null;
  }
  if (recoil > 0) recoil--;
}
