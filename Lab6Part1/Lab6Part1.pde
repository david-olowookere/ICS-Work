int squareColor = #000000;
ArrayList widgetList;
PFont stFont;

void setup() {
  Widget widget1, widget2, widget3;
  size(400, 400);
  stFont=loadFont("Chiller-Regular-36.vlw"); 
  textFont(stFont);
  widget1 = new Widget(10, 10, 120, 40, "RED", color(#FF0000), stFont, 1);
  widget2 = new Widget(140, 10, 120, 40, "GREEN", color(#00FF00), stFont, 2);
  widget3 = new Widget(270, 10, 120, 40, "BLUE", color(#0000FF), stFont, 3);
  widgetList = new ArrayList();
  widgetList.add(widget1); 
  widgetList.add(widget2);
  widgetList.add(widget3);
}

void draw() {
  for (int i = 0; i<widgetList.size(); i++) {
    Widget aWidget = (Widget) widgetList.get(i);
    aWidget.draw();
  }
  fill(squareColor);
  noStroke();
  rect(100, 125, 200, 200);
}

void mousePressed() {
  int event;
  for (int i = 0; i<widgetList.size(); i++) {
    Widget aWidget = (Widget) widgetList.get(i);
    event = aWidget.getEvent(mouseX, mouseY);
    switch (event) {
    case 1:
      println("CODE RED!");
      squareColor = #FF0000;
      break;
    case 2:
      println("CODE GREEN!");
      squareColor = #00FF00;
      break;
    case 3:
      println("CODE BLUE!");
      squareColor = #0000FF;
      break;
    }
  }
}
