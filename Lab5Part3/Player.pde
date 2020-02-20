class Player {
  int xpos;
  int xend;
  int ypos;
  int paddleCentre;
  int currentSpeed;
  int lives = 3;
  color paddlecolor = color(220);

  Player(int screen_y)
  {
    xpos = CENTRE;
    ypos = screen_y;
  }

  void move(int x) {
    paddleCentre = (PADDLEWIDTH/2)+xpos;
    xend = PADDLEWIDTH+xpos;
    if (x>SCREENX-PADDLEWIDTH) xpos = SCREENX-PADDLEWIDTH;
    else if (x<0) xpos = 0; 
    else {
      currentSpeed = xpos-x;
      xpos=x;
    }
  }

  void draw() {
    fill(paddlecolor);
    rect(xpos, ypos, PADDLEWIDTH, PADDLEHEIGHT);
  }
}
