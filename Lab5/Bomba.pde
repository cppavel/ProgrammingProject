class Bomba //Eastern European Bomb (Tsar bomba)
{
  int x;
  int y;
  public Bomba(int x, int y)
  {
    this.x = x;
    this.y = y;
  }
  
  public void move()
  {
    y++;
  }
  
  public void draw()
  {
    image(topolM,x,y,BOMBSIZEX,BOMBSIZEY);
  }
  
  public boolean offScreen()
  {
    return y>=SCREENY;
  }
  
  public boolean collide(Player p)
  {
    int ef_x = x + BOMBSIZEX;
    int ef_y = y + BOMBSIZEY;
    
    return (ef_x>=p.xpos&&(p.xpos + PLAYERSIZEX>=ef_x)&&ef_y>=p.ypos&&ef_y<=p.ypos + PLAYERSIZEY);
  }
}
