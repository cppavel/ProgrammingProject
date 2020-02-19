class BulletDM
{
  int sizeX = DEFAULT_BULLET_SIZE_Y;
  int sizeY = DEFAULT_BULLET_SIZE_Y;
  int x;
  int y = SCREENY-sizeY-PLAYERSIZEY + CORRECTION; 
  int speed = SPEED; 
  
  public BulletDM(int x)
  {
    this.x = x;
  }
  
  void collide(Alien[] aliens)
  {
    for(int i = 0; i< aliens.length;i++)
    {
      if(!aliens[i].exploaded&&checkIfCollided(aliens[i]))
      {
          aliens[i].timeWhenExp = millis();
          aliens[i].setExpld(true);
          int det = (int)random(0,4);
          float prob = random(0,1);
          if(prob>=0.3)
          {
            switch(det)
            {
              case 0: pU.add(new PowerUp(aliens[i].x,aliens[i].y,PowerUpType.DOUBLE_BULLETS, powerups[0]));break;
              case 1: pU.add(new PowerUp(aliens[i].x,aliens[i].y,PowerUpType.RPG, powerups[1]));break;
              case 2: pU.add(new PowerUp(aliens[i].x,aliens[i].y,PowerUpType.FIRING_RATE, powerups[2]));break;
            }
          }
      }
    }
  }
  
  boolean checkIfCollided(Alien alien)
  {
    int ef_x = this.x + this.sizeX/2;
    int ef_y = this.y + this.sizeY/2;
    return (ef_x>=alien.x&&ef_x<=alien.x +ALIENSIZEX)&&
          (ef_y>=alien.y&&ef_y<=alien.y + ALIENSIZEY);
  }
  
  void move()
  {
    y = y - speed;
  }
  
  void draw()
  {
    image(bullet, x,y,sizeX,sizeY);
  }

}
