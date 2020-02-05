PImage[] alien = new PImage[alienTypes]; 
PImage explosion;
Alien[] aliens = new Alien[N];
int xinit = 0;
int yinit = 100;
int alienToExplode = -1;
int lastval = 1;
float time;
void settings()
{
    size(SCREENX, SCREENY);
}

void setup()
{

  time = millis();
  alien[0] = loadImage("spacer.gif");
  alien[1] = loadImage("j.png");
  alien[2] = loadImage("alien3.png");
  alien[3] = loadImage("alien2.png");
  explosion = loadImage("exploding.gif");
  float defineSine;
  for(int i = 0;i<N;i++)
  {
    defineSine = random(0,4.5);
    if(defineSine>3)
    {
      aliens[i] = new Alien(xinit,yinit,true);
    }
    else
    {
      aliens[i] = new Alien(xinit,yinit,false);
    }
    xinit+=step;
  }
}

void draw()
{
  background(255);
  if((int)(millis()-time)/1000>lastval)
  {
    lastval = (int)(millis()-time)/1000;
    alienToExplode = (int)random(0,9.99999);
    if(!aliens[alienToExplode].exploaded)
    {
      aliens[alienToExplode].timeWhenExp = millis();
      aliens[alienToExplode].setExpld(true);
    }
  }
  for(int i = 0; i<N;i++)
  {
    if(aliens[i].exploaded&&(millis()-aliens[i].timeWhenExp)/1000<3)
    {
      aliens[i].move();
      aliens[i].draw();
    }
    else if(!aliens[i].exploaded)
    {
      aliens[i].move();
      aliens[i].draw();
    }
  }
  
}
