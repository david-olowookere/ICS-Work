class Screen {
  ArrayList widgetList;
  int backgroundColor;
  int number;

  Screen(int backgroundColor) {
    this.backgroundColor = backgroundColor;
    screenNumber++;
    widgetList = new ArrayList();
  }

  int getEvent() {
    int event = EVENT_NULL;
    for (int i = 0; i < widgetList.size(); i++) {
      Widget aWidget = (Widget) widgetList.get(i);
      event = aWidget.getEvent(mouseX, mouseY);
      if (event != EVENT_NULL) return event;
    }
    return event;
  }

  void addWidget(Widget widget) {
    if (widgetList != null) widgetList.add(widget);
  }

  void draw() {
    background(backgroundColor);
    for (int i = 0; i<screenList.size(); i++) {
      if (widgetList != null) {
        Widget aWidget = (Widget) widgetList.get(i);
        aWidget.draw();
      }
    }
  }
}
