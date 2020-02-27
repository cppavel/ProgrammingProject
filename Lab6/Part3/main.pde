
Screen screen1;
Screen screen2;
Screen current_screen;

int x_init = 100, y_init = 100;
PFont defaultfont;

void settings()
{
  size(screenx,screeny);
  defaultfont = loadFont("Arial-BoldMT-14.vlw");

}

void setup()
{
  screen1 = new Screen(color(0,0,0));
  screen2 = new Screen(color(89,120,123));
  screen1.addWidget(x_init,y_init,defbutsizex,defbutsizey,"Button1",color(255,0,0), defaultfont, 1);
  screen1.addWidget(x_init,y_init+2*defbutsizey,defbutsizex,defbutsizey,"Forward",color(0,255,0), defaultfont, 2);
  screen2.addWidget(x_init,y_init,defbutsizex,defbutsizey,"Button2",color(255,0,0), defaultfont, 1);
  screen2.addWidget(x_init,y_init+2*defbutsizey,defbutsizex,defbutsizey,"Backward",color(0,255,0), defaultfont, 2);
  current_screen = screen1;
}

void mousePressed()
{
    int event = current_screen.getEvent();
    if(event!=E)
    {
      if(current_screen==screen1)
      {
        if(event==1)
        {
          println("Button 1 was pressed");
        }
        else if(event==2)
        {
          current_screen = screen2;
        }
        
      }
      else if(current_screen==screen2)
      {
        if(event==1)
        {
          println("Button 2 was pressed");
        }
        else if(event==2)
        {
          current_screen = screen1;
        }
        
      }
    }
}

void mouseMoved()
{
    for(int i = 0;i<current_screen.widgets.size();i++)
  {
    int event = current_screen.widgets.get(i).getEvent(mouseX,mouseY);
    if(event!=E)
    {
      current_screen.widgets.get(i).border = true;
    }
    else
    {
      current_screen.widgets.get(i).border = false;
    }
  }
}

void draw()
{
  current_screen.draw();
}
