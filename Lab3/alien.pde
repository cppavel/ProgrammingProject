
class Alien
{
  int x;
  int y;
  int counter = 0;
  boolean left = false;
  boolean right = true;
  boolean down = false;
  boolean flag = true;
  boolean exploaded = false;
  float timeWhenExp = -1;
  PImage currentPicture; 
  int speed = 1;
  int last = 0;
  boolean movesInSineFashion = false;
  
  
  int sin(int x,int y)
  {
     return y + (int)(3*Math.sin(6*Math.PI*x*1.0/SCREENX));
  }
  
  Alien(int x, int y, boolean isSine)
  {
    this.x = x;
    this.y = y;
    currentPicture = alien[(int)random(0,3.99999)];
    movesInSineFashion = isSine;
  }
  
  void setExpld(boolean exp)
  {
    this.exploaded = exp;
  }
  
  void draw()
  {
    if(!exploaded)
    {
      image(currentPicture,x,y,ALIENSIZEX, ALIENSIZEY);
    }
    else
    {
      image(explosion,x,y,ALIENSIZEX, ALIENSIZEY);
    }
  }
  
  void move()
  {
    if((int)(millis()-time)/3000>last)
    {
        speed++;
        last++;
    }
    if(right)
    {
      if(movesInSineFashion)
          y = sin(x,y);
      x = x + speed; //<>//
    }
    if(left)
    {
      if(movesInSineFashion)
          y = sin(x,y);
      x = x - speed;
    }
    if(down)
    {
      y = y + speed;
      counter = counter + speed;
    }
    
    
    if((x+ALIENSIZEX>=SCREENX-1||x<=0 )&& counter == 0)
    {
      down = true;
      right = left =false;
    }
    else if(counter>=ALIENSIZEY)
    {
      counter = 0;
      if(flag)
      {
        down = right = false;
        left = true;
        flag = false;
      }
      else
      {
        down = left = false;
        right = true;
        flag = true;
      }
    }
    
 
    
  }
}
