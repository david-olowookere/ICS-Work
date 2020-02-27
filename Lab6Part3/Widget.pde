class Widget {
  int x, y, width, height;
  String label; 
  int event;
  color widgetColor, labelColor;
  PFont widgetFont;
  PImage widgetImage;
  boolean imageWidget;

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
    imageWidget = false;
  }
  Widget(int x, int y, PImage image, int event) {
    this.x=x; 
    this.y=y;
    this.widgetImage = image;
    this.event=event;
    imageWidget = true;
  }

  void draw() {
    if (!imageWidget) {
      fill(widgetColor);
      if (hover(mouseX, mouseY)) stroke(255);
      else stroke(0);
      rect(x, y, width, height);
      fill(labelColor);
      text(label, x+10, y+height-10);
    } else {
      if (hoverImage(mouseX, mouseY)) image(buttonUp, x, y);
      else image(buttonDown, x, y);
    }
  }

  boolean hover(int mX, int mY) {
    return (mX>x && mX < x+width && mY >y && mY <y+height);
  }

  boolean hoverImage(int mX, int mY) {
    return (mX>x && mX < x+this.widgetImage.width && mY >y && mY <y+this.widgetImage.height);
  }

  int getEvent(int mX, int mY) {
    if (!imageWidget) {
      if (hover(mX, mY)) return event;
    } else if (hoverImage(mX, mY)) return event;
    return EVENT_NULL;
  }
}

class Checkbox extends Widget {
  boolean selected;

  Checkbox(int x, int y, int width, int height, String label, color widgetColor, PFont widgetFont, int event) {
    super(x, y, width, height, label, widgetColor, widgetFont, event);
    selected = false;
  }

  void draw() {
    if (hover(mouseX, mouseY)) stroke(255);
    else stroke(0);
    if (selected) {
      fill(widgetColor);
      rect(x, y, width, height);
      fill(labelColor);
      text(label, x+10, y+height-10);
    } else {
      fill(255);
      rect(x, y, width, height);
      fill(widgetColor);
      text(label, x+10, y+height-10);
    }
  }

  boolean hover(int mX, int mY) {
    return (mX > x && mX < x + width && mY > y && mY < y + height);
  }

  int getEvent(int mX, int mY) {
    if (hover(mX, mY)) {
      selected = !selected;
      return event;
    }
    return EVENT_NULL;
  }
}

class Radio extends Widget {
  int channel;

  Radio(int x, int y, int width, int height, String label, color widgetColor, PFont widgetFont, int event) {
    super(x, y, width, height, label, widgetColor, widgetFont, event);
    channel = radioNumber;
    radioNumber++;
  }

  void draw() {
    if (hover(mouseX, mouseY)) stroke(255);
    else stroke(0);
    if (radioNumber == channel) {
      fill(widgetColor);
      rect(x, y, width, height);
      fill(labelColor);
      text(label, x+10, y+height-10);
    } else {
      fill(255);
      rect(x, y, width, height);
      fill(widgetColor);
      text(label, x+10, y+height-10);
    }
  }

  boolean hover(int mX, int mY) {
    return (mX > x && mX < x + width && mY > y && mY < y + height);
  }

  int getEvent(int mX, int mY) {
    if (hover(mX, mY)) {
      radioNumber = channel;
      return event;
    }
    return EVENT_NULL;
  }
}
