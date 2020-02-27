widget[] widgets1;
int x_init = 100, y_init = 100;
PFont defaultfont;
void settings()
{
  size(screenx,screeny);
  defaultfont = loadFont("Arial-BoldMT-14.vlw");
  
}
void setup()
{
  
  strokeWeight(5);

  widgets1 = new widget[N];
  widgets1[0] = new widget(x_init,y_init,defbutsizex,defbutsizey,"Blue",color(100, 100,100), defaultfont, 1);
  y_init+=defbutsizey*2;
  widgets1[1] = new widget(x_init,y_init,defbutsizex,defbutsizey,"Red",color(100, 100,100), defaultfont, 2);
  y_init+=defbutsizey*2;
  widgets1[2] = new widget(x_init,y_init,defbutsizex,defbutsizey,"Green",color(100, 100,100), defaultfont, 3);
  y_init+=defbutsizey*2;
  
}

void mousePressed()
{
  for(int i = 0; i< N;i++)
  {
    int event = widgets1[i].getEvent(mouseX,mouseY);
    switch(event)
    {
      case 1: widgets1[i].widgetColor = color(0,0,255); break;
      case 2: widgets1[i].widgetColor = color(255,0,0); break;
      case 3: widgets1[i].widgetColor = color(0,255,0); break;
    }
  }
}

void mouseMoved()
{
  for(int i = 0;i<N;i++)
  {
    int event = widgets1[i].getEvent(mouseX,mouseY);
    if(event!=E)
    {
      widgets1[i].border = true;
    }
    else
    {
      widgets1[i].border = false;
    }
  }
}


void draw()
{
  background(0);
  for(int i = 0;i<N;i++)
  {
    widgets1[i].draw();
  }
}
