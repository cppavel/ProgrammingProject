
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
  Bomba bomb;
  
  
  int sin(int x)
  {
     return (int)(25*Math.sin(6*Math.PI*x*1.0/SCREENX));
  }
  
  Alien(int x, int y, boolean isSine)
  {
    this.x = x;
    this.y = y;
    currentPicture = alien[(int)random(0,4)];
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
      if(movesInSineFashion)
      {
        image(currentPicture,x,y +sin(x),ALIENSIZEX, ALIENSIZEY);
      }
      else
      {
        image(currentPicture,x,y,ALIENSIZEX, ALIENSIZEY);
      }     
    }
    else
    {
      if(movesInSineFashion)
      {
        image(explosion,x,y +sin(x),ALIENSIZEX, ALIENSIZEY);
      }
      else
      {   
        image(explosion,x,y,ALIENSIZEX, ALIENSIZEY);       
      } 
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
      x = x + speed; 
    }
    if(left)
    {
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
  
  void dropBomb()
  {
    double prob = random(0,1);
    if(prob<0.01&&!exploaded&&(bomb==null||bomb.offScreen()))
    {
      bomb = new Bomba(this.x,this.y);
    }
  }
}
