class Bullet {
  int x;
  int y;
  int speed = 10;
  int timeToExist = SCREENY/3; 
  color bulletColor = color(87, 120, 47);

  Bullet (int paddleX, int paddleY) {
    x=paddleX;
    y=paddleY-BULLETHEIGHT;
  }

  void move() {
    y -= speed;
    timeToExist--;
  }
  void draw() {
    fill(bulletColor);
    rect(x, y, BULLETWIDTH, BULLETHEIGHT);
  }
  void collide(Alien array[]) {
    for (int i = 0; i < array.length; i++) {
      if (x >= array[i].x && x <= array[i].x+array[i].thisImage.width && y >= array[i].y && y <= array[i].y+array[i].thisImage.height && array[i].lifeState == 0) {
        array[i].lifeState = 1;
        array[i].boomTime = 25;
      }
    }
  }
}
