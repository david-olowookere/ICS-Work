ArrayList screenList;
int screenNumber;
PFont stFont;
PImage buttonDown, buttonUp;

void setup() {
  Widget widgetNext, widgetBack, widgetLeft, widgetKangas;
  Screen screenFirst, screenLast;
  size(400, 400);
  stFont=loadFont("Chiller-Regular-36.vlw"); 
  textFont(stFont);

  buttonDown = loadImage("Kangas.gif");
  buttonUp = loadImage("KHAAAN.gif");

  widgetNext = new Widget(10, 10, 120, 40, "RED", color(#FF0000), stFont, 1);
  widgetBack = new Widget(270, 10, 120, 40, "BLUE", color(#0000FF), stFont, 2);
  widgetLeft = new Widget(140, 10, 120, 40, "GREEN", color(#00FF00), stFont, 3);
  widgetKangas = new Widget(72, 100, buttonDown, 4);

  screenFirst = new Screen(#BA0BAB);
  screenFirst.addWidget(widgetNext);
  screenFirst.addWidget(widgetLeft);
  screenLast = new Screen(#AAAAAA);
  screenLast.addWidget(widgetBack);
  screenLast.addWidget(widgetKangas);
  screenList = new ArrayList();
  screenNumber = 0;
  screenList.add(screenFirst);
  screenList.add(screenLast);
}

void draw() {
  Screen aScreen = (Screen) screenList.get(screenNumber);
  aScreen.draw();
}

void mousePressed() {
  int event;
  Screen aScreen = (Screen) screenList.get(screenNumber);
  event = aScreen.getEvent();
  switch (event) {
  case 1:
    println("Next page.");
    screenNumber = 1;
    break;
  case 2:
    println("Last page.");
    screenNumber = 0;
    break;
  case 3:
    println("CODE LEFT!");
    break;
  case 4:
    println("Hey, no one said the widgets HAD to be regular buttons. Or public domain images.");
  default:
    break;
  }
}
