class Ball {
  
float x; float y;
float dx; float dy;
int radius;
int vel = 0;
color ballColor = color(200, 100, 50);

Ball()
{
  x = random(SCREENX/4, SCREENX/2);
  y = random(SCREENY/4, SCREENY/2);
  dx = random(1, 2); dy = random(1,2);
  radius=10;
}

void move(){
  x = x+dx; y = y+dy;
}

void updateSpeed()
{
  float mul = (millis()-time)/15000;
  dx = dx*(1+mul)/mul;
  dy = dy*(1+mul)/mul;
  println(dx+ "  " +dy);
}
void draw(){
  fill(ballColor);
  ellipse(int(x), int(y), radius,radius);
}

boolean reset()
{
  if(Math.round(y)<0||Math.round(y)>SCREENY)
  {
      x = random(SCREENX/4, SCREENX/2);
      y = random(SCREENY/4, SCREENY/2);
      dx = 0;
      dy = 0;
      return true;
  }
  return false;
  
}

void collideWall()
{
   if(x-radius <=0) dx=-dx;
   else if(x+radius>=SCREENX) dx=-dx;
}

boolean collide(Player tp)
{
 
  
  if(y+radius >= tp.ypos&&y-radius<tp.ypos+PADDLEHEIGHT &&
      x >=tp.xpos && x <=tp.xpos+PADDLEWIDTH)
  {
      vel = (mouseX - pmouseX)/7;
      dy = dy + Math.abs(vel);
      dy = -dy;
      dx = dx + vel;
      return true;
  }
  
  return false;
}

}
