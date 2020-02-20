class Bomb {
  PImage bombImage;
  int x;
  int y;

  Bomb(PImage image, int xpos, int ypos) {
    x = xpos;
    y = ypos;
    bombImage = image;
  }

  void move() {
    y+=2;
  }

  boolean offScreen() {
    return (y >= SCREENY);
  }

  boolean collide(Player tp) {
    return (x+bombImage.width >= tp.xpos && x <= tp.xpos+PADDLEWIDTH && y+bombImage.height >= tp.ypos && y <= tp.ypos+PADDLEHEIGHT);
  }

  void draw() {
    image(bombImage, x, y);
  }
}
