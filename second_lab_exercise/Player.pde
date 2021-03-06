class Player {
int xpos; int ypos;
color paddlecolor = color(50);
boolean isPlayer;
int wins = 0;
int speed = 2;
Player(int screen_y,boolean xui)
{
  isPlayer = xui;
  xpos=SCREENX/2;
  ypos=screen_y;
}
void move(int x){
  if(x>SCREENX-PADDLEWIDTH) xpos = SCREENX-PADDLEWIDTH;
  else xpos=x;
}

void score(int y)
{
  if(y<0&&isPlayer)
  {
    wins++;
  }
  
  if(y>SCREENY&&!isPlayer)
  {
    wins++;
  }
}
void computerMove(int ball_position)
{
  if(ball_position-(xpos+PADDLEWIDTH/2)<0)
  {
    xpos = xpos - speed ;
  }
  else if (ball_position-(xpos+PADDLEWIDTH/2)>0)
  {
    xpos = xpos + speed ;
  }
}

void updateSpeed()
{
  int mul = (millis()-time)/15000;
  speed = speed*(1+mul)/mul;;
  println("cpu speed "+speed);
}

void draw()
{
  fill(paddlecolor);
  rect(xpos, ypos, PADDLEWIDTH, PADDLEHEIGHT);
}
}
