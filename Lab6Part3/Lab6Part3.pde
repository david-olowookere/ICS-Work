ArrayList screenList;
int screenNumber;
int radioNumber;
PFont stFont;
PImage buttonDown, buttonUp;

void setup() {
  Widget widgetNext, widgetBack, widgetLeft, widgetKangas;
  Checkbox checkBox1, checkBox2, checkBox3;
  Radio radio1, radio2, radio3;
  Screen screenFirst, screenLast, screenCheck, screenRadio;
  radioNumber = 0;
  size(400, 400);
  stFont=loadFont("Chiller-Regular-36.vlw"); 
  textFont(stFont);

  buttonDown = loadImage("Kangas.gif");
  buttonUp = loadImage("KHAAAN.gif");

  widgetNext = new Widget(270, 10, 120, 40, "Next", color(#FF0000), stFont, 1);
  widgetBack = new Widget(10, 10, 120, 40, "Back", color(#0000FF), stFont, 2);
  widgetLeft = new Widget(140, 10, 120, 40, "Print", color(#00FF00), stFont, 3);
  widgetKangas = new Widget(72, 100, buttonDown, 4);
  checkBox1 = new Checkbox(140, 70, 120, 40, "Me", color(128), stFont, 0);
  checkBox2 = new Checkbox(140, 140, 120, 40, "Me", color(128), stFont, 0);
  checkBox3 = new Checkbox(140, 210, 120, 40, "Me", color(128), stFont, 0);
  radio1 = new Radio(140, 70, 120, 40, "Me", color(128), stFont, 0);
  radio2 = new Radio(140, 140, 120, 40, "Me", color(128), stFont, 0);
  radio3 = new Radio(140, 210, 120, 40, "Me", color(128), stFont, 0);

  screenFirst = new Screen(#BA0BAB);
  screenFirst.addWidget(widgetNext);
  screenFirst.addWidget(widgetLeft);
  
  screenLast = new Screen(#AAAAAA);
  screenLast.addWidget(widgetNext);
  screenLast.addWidget(widgetBack);
  screenLast.addWidget(widgetLeft);
  screenLast.addWidget(widgetKangas);
  
  screenCheck = new Screen(0);
  screenCheck.addWidget(widgetNext);
  screenCheck.addWidget(widgetBack);
  screenCheck.addWidget(checkBox1);
  screenCheck.addWidget(checkBox2);
  screenCheck.addWidget(checkBox3);
  
  screenRadio = new Screen(#fef65b);
  screenRadio.addWidget(widgetBack);
  screenRadio.addWidget(radio1);
  screenRadio.addWidget(radio2);
  screenRadio.addWidget(radio3);
  
  screenList = new ArrayList();
  screenList.add(screenFirst);
  screenList.add(screenLast);
  screenList.add(screenCheck);
  screenList.add(screenRadio);
  screenNumber = 0;
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
    screenNumber++;
    break;
  case 2:
    println("Previous page.");
    screenNumber--;
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
