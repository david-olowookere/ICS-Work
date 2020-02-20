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
    y++;
  }

  boolean offScreen() {
    return (y >= SCREENY);
  }

  void draw() {
    image(bombImage, x, y);
  }
}
