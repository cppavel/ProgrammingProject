enum PowerUpType {DOUBLE_BULLETS, RPG, FIRING_RATE};
class PowerUp
{
  int x;
  int y;
  int speed = 2;
  PowerUpType pU;
  PImage img;
  boolean used = false;
  
  public PowerUp(int x, int y, PowerUpType pU, PImage img)
  {
    this.x = x;
    this.y = y;
    this.pU = pU;
    this.img = img;
  }
  
  void draw()
  {
    image(img, x,y,POWER_UP_SIZE_X, POWER_UP_SIZE_Y);
  }
  
  void collide(Player p)
  {
   if(!used)
   {
    int ef_x = x + POWER_UP_SIZE_X/2;
    int ef_y = y + POWER_UP_SIZE_Y/2;
    if(ef_x>=p.xpos&&ef_x<=p.xpos+PLAYERSIZEX&&
      ef_y>=p.ypos&&ef_y<=p.ypos +PLAYERSIZEY)
      {
        if(pU == PowerUpType.DOUBLE_BULLETS)
        {
          p.double_bullets = true;
          p.double_bullets_time = millis();
          println("double_bullets");
        }
        else if (pU == PowerUpType.RPG)
        {
          p.rpg = true;
          p.rpg_time = millis();
          println("rpg");
        }
        else if(pU == PowerUpType.FIRING_RATE)
        {
          p.firingRate*=2;
          p.increased_rate = true;
          p.firingRate_time = millis();
          println("f_rate");
        }
        used = true;
      }
   }
  }
  
  void move()
  {
    y = y + speed;
  }
  
  
}
