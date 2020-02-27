class widget 
{
  int x, y, width, height;
  String label; 
  int event;
  color widgetColor, labelColor;
  PFont widgetFont;
  boolean border = false;
  
  widget(int x, int y, int width, int height, String label, color widgetColor, PFont widgetFont, int event)
  {
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
  void draw()
  { 
    if(border)
    {
      stroke(255,255,255);
    }
    fill(widgetColor);
    rect(x, y, width, height);
    fill(labelColor);
    text(label, x+10, y+height-10);
    noStroke();
  }
  int getEvent(int mX, int mY)
  {
    if (mX>x && mX < x+width && mY >y && mY <y+height)
    {
      return event;
    }
    return E;
  }
}
