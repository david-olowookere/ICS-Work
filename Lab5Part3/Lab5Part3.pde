PImage zookaImage; //<>//
PImage sleepImage;
PImage boomImage;
PImage bombImage;
color textColor;

Player thePlayer;
Alien badZookas[];
ArrayList<Bullet> bullets = new ArrayList<Bullet>();

int recoil;
int spawn_x, spawn_y;

boolean gameOver = false;
boolean gameWon = false;

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
  gameWon = true;
  for (int i = 0; i < array.length; i++) {
    if (array[i] != null) {
      array[i].move();
      array[i].draw(); 
      if (array[i].lifeState < 1) {
        gameWon = false;
        array[i].getBomb();
        if (array[i].myBomb != null) {
          if (!gameOver && !array[i].myBomb.offScreen()) {
            gameOver = array[i].myBomb.collide(thePlayer);
            array[i].myBomb.draw();
          } else array[i].myBomb = null;
        }
      }
    }
  }
}

void mousePressed() {
  if (recoil <= 0 && !gameOver) {
    bullets.add(new Bullet(thePlayer.paddleCentre-BULLETWIDTH, thePlayer.ypos));
    recoil = COOLDOWN;
  }
}

void draw() {
  background(0);
  if (!gameWon) move_array(badZookas);
  thePlayer.move(mouseX);
  thePlayer.draw();
  for (Bullet b : bullets) {
    b.move();
    b.collide(badZookas);
    if (b.y + BULLETHEIGHT >= 0) b.draw(); 
    else b = null;
  }
  if (gameOver) {
    fill(textColor);
    text("Game over. You lose.", 50, 250);
  } else if (gameWon) {
    fill(textColor);
    text("The aliens have been \ndefeated. You win!", 50, 250);
  } else if (recoil > 0) recoil--;
}
