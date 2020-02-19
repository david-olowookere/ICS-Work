class PowerUps {
  int x, y, type;
  PImage icon;

  PowerUps(int xpos, int ypos, int category, PImage image) {
    x = xpos;
    y = ypos - 1;
    type = category;
    icon = image;
  }

  void draw() {
    y++;
    image(icon, x, y);
  }
  void powerUp() {
    switch (type) {
    case 0:
    case 1:
      for (int i = 0; i < badZookas.length; i++) {
        badZookas[i].speed /= 2;
      }
      break;
    case 2:
    default:
      break;
    }
  }
}
