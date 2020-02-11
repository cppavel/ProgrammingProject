class Player {
float firingRate = 1;
int xpos; int ypos;
color paddlecolor = color(50);
boolean double_bullets = false;
int double_bullets_time = -1;
boolean rpg = false;
int rpg_time = -1;
boolean increased_rate = false;
int firingRate_time = - 1;

Player(int screen_y)
{
  xpos=SCREENX/2;
  ypos=screen_y;
}
void move(int x){
  
  if(x>=0&&x<=SCREENX-1)
  {
    if(x>SCREENX - PLAYERSIZEX) xpos = SCREENX-PLAYERSIZEX;
    else xpos=x;
  }
}


void draw()
{
  fill(paddlecolor);
  image(spaceship,xpos, ypos, PLAYERSIZEX, PLAYERSIZEY);
}

void update_pu()
{
  if(double_bullets_time>0)
  {
    if((millis()-double_bullets_time)/1000>2)
    {
      if(double_bullets)
      {
        double_bullets = false;
        println("double bullets set back");
      }
    }
  }
  
  if(rpg_time>0)
  {
    if((millis()-rpg_time)/1000>2)
    {
      if(rpg)
      {
        rpg = false;
        println("rpg set back");
      }
    }
  }
  
  if(firingRate_time>0)
  {
    if((millis()-firingRate_time)/1000>2)
    {
      if(increased_rate)
      {
        increased_rate = false;
        firingRate = firingRate/2;
        println("fire rate set back");
      }
    }
  }
}
}
