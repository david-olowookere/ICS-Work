class Widget {
  int x, y, width, height;
  String label; 
  int event;
  color widgetColor, labelColor;
  PFont widgetFont;
  Widget(int x, int y, int width, int height, String label, color widgetColor, PFont widgetFont, int event) {
    this.x=x; 
    this.y=y; 
    this.width = width; 
    this.height= height;
    this.label=label; 
    this.event=event; 
    this.widgetColor=widgetColor; 
    this.widgetFont=widgetFont;
    labelColor= color(0);
  }
  
  void draw() {
    fill(widgetColor);
    if (hover(mouseX, mouseY)) stroke(255);
    else stroke(0);
    rect(x, y, width, height);
    fill(labelColor);
    text(label, x+10, y+height-10);
  }
  
  boolean hover(int mX, int mY) {
    return (mX>x && mX < x+width && mY >y && mY <y+height);
  }
  
  int getEvent(int mX, int mY) {
    if (hover(mX, mY)) {
      return event;
    }
    return EVENT_NULL;
  }
}
