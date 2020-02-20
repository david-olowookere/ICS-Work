class Alien { //<>//
  PImage thisImage;
  PImage explosImage;
  PImage bombPic = bombImage;
  Bomb myBomb = null;
  int x;
  float y;
  int dropHeight = 0;
  int boomTime;
  float speed = 1;
  int movementState = A_FORWARD;
  int lifeState = 0;

  Alien(int xpos, int ypos, PImage alienImage, PImage boomImage) {
    x = xpos;
    y = ypos;
    thisImage = alienImage;
    explosImage = boomImage;
  }

  void move() {
    switch (lifeState) {
    case 0:
      switch (movementState) {
      case A_FORWARD:
        x += speed;
        if (x >= SCREENX-thisImage.width) movementState = A_DOWN;
        break;
      case A_BACKWARD:
        x -= speed;
        if (x <= 0) movementState = A_DOWN;
        break;
      case A_DOWN:
        y++;
        dropHeight++;
        if (dropHeight >= thisImage.height) {
          dropHeight = 0;
          if (x >= SCREENX-thisImage.width) movementState = A_BACKWARD;
          else movementState = A_FORWARD;
        }
        break;
      default:
      }
      speed += 0.001;
      break;
    case 1:
      boomTime--;
      if (boomTime <= 0) lifeState = 2;

    case 2:
    default:

      break;
    }
  }

  void getBomb() {
    if (myBomb == null) {
      if (random(0, 100) <= 1) myBomb = new Bomb(bombPic, x, int(y+thisImage.height));
    } else myBomb.move();
  }

  void draw() {
    switch (lifeState) {
    case 0:
      image(thisImage, x, y);
      break;
    case 1:
      image(explosImage, x, y);
    default:
      break;
    }
  }
}
