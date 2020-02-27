class Screen
{
  ArrayList<widget> widgets = new ArrayList<widget>();
  color backgroundcolor;
  Screen(color col)
  {
    backgroundcolor = col;
  }
  
  int getEvent()
  {
    for(int i = 0 ;i < widgets.size();i++)
    {
        int elem = widgets.get(i).getEvent(mouseX,mouseY);
        if(elem!=E)
        {
          return elem;
        }
    }
    
    return E;
  }
  
  void addWidget(int x, int y, int width, int height, String label, color widgetColor, PFont widgetFont, int event)
  {
    widgets.add(new widget(x,y,width,height,label,widgetColor,widgetFont,event));
  }
  
  void draw()
  {
    background(backgroundcolor);
    for(int i =0;i<widgets.size();i++)
    {
      widgets.get(i).draw();
    }
  }
  
  
}
