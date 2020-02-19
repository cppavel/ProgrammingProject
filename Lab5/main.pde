import java.util.Iterator;
PFont font;
ArrayList<BulletDM> bullets = new ArrayList<BulletDM>();
ArrayList<PowerUp> pU = new ArrayList<PowerUp>();
Player player = new Player(SCREENY-ALIENSIZEY-MARGIN);
PImage[] alien = new PImage[alienTypes]; 
PImage[] powerups = new PImage[POWERUPS];
PImage explosion;
PImage spaceship;
PImage bullet;
PImage topolM;
Alien[] aliens = new Alien[N];
int xinit = 0;
int yinit = 100;
float time;
float lastShot = 0;
boolean gameover = false;
boolean player_won = false;
void settings()
{
  size(SCREENX, SCREENY);
}

void setup()
{
  time = millis();
  font = loadFont("Century-30.vlw");
  powerups[0] = loadImage("DOUBLE_BULLETS.jpg");
  powerups[1] = loadImage("rpg.png");
  powerups[2] = loadImage("speedpu.png");
  alien[0] = loadImage("spacer.gif");
  alien[1] = loadImage("j.png");
  alien[2] = loadImage("alien3.png");
  alien[3] = loadImage("alien2.png");
  explosion = loadImage("exploding.gif");
  spaceship = loadImage("spaceship.jpg");
  bullet = loadImage("bullet.png");
  topolM = loadImage("bomb.png");
  float defineSine;
  for (int i = 0; i<N; i++)
  {
    defineSine = random(0, 4.5);
    if (defineSine>3)
    {
      aliens[i] = new Alien(xinit, yinit, true);
    } else
    {
      aliens[i] = new Alien(xinit, yinit, false);
    }
    xinit+=step;
  }
}

void mousePressed()
{
  if ((1.0*millis()-lastShot)/1000>=1/player.firingRate)
  {    
    if (!player.double_bullets&&!player.rpg)
    {
      bullets.add(new BulletDM(player.xpos + PLAYERSIZEX/2-DEFAULT_BULLET_SIZE_X/2));
    } else if (player.double_bullets)
    {
      if (!player.rpg)
      {
        bullets.add(new BulletDM(player.xpos + PLAYERSIZEX/4-DEFAULT_BULLET_SIZE_X/2));
        bullets.add(new BulletDM(player.xpos + 3*PLAYERSIZEX/4-DEFAULT_BULLET_SIZE_X/2));
      } else
      {
        BulletDM tmp = new BulletDM(player.xpos + PLAYERSIZEX/4-DEFAULT_BULLET_SIZE_X/2);
        tmp.sizeX = tmp.sizeX*2;
        tmp.sizeY = tmp.sizeY*2;
        bullets.add(tmp);
        BulletDM tmp1 = new BulletDM(player.xpos + 3*PLAYERSIZEX/4-DEFAULT_BULLET_SIZE_X/2);
        tmp1.sizeX = tmp1.sizeX*2;
        tmp1.sizeY = tmp1.sizeY*2;
        bullets.add(tmp1);
      }
    } else
    {
      BulletDM tmp = new BulletDM(player.xpos + PLAYERSIZEX/2-DEFAULT_BULLET_SIZE_X/2);
      tmp.sizeX = tmp.sizeX*2;
      tmp.sizeY = tmp.sizeY*2;
      bullets.add(tmp);
    }
    lastShot = millis();
  }
}

void move_bullets()
{
  Iterator iter = bullets.iterator();
  while (iter.hasNext())
  {
    ((BulletDM)iter.next()).move();
  }
}

void draw_bullets()
{
  Iterator iter = bullets.iterator();
  while (iter.hasNext())
  {
    ((BulletDM)iter.next()).draw();
  }
}

void collide_bullets()
{
  Iterator iter = bullets.iterator();
  while (iter.hasNext())
  {
    ((BulletDM)iter.next()).collide(aliens);
  }
}

void move_pu()
{
  Iterator iter = pU.iterator();
  while (iter.hasNext())
  {
    ((PowerUp)iter.next()).move();
  }
}

void draw_pu()
{
  Iterator iter = pU.iterator();
  while (iter.hasNext())
  {
    ((PowerUp)iter.next()).draw();
  }
}

void collide_pu()
{
  Iterator iter = pU.iterator();
  while (iter.hasNext())
  {
    ((PowerUp)iter.next()).collide(player);
  }
}

boolean all_aliens_dead()
{
  for(int i = 0;i < N;i++)
  {
    if(!aliens[i].exploaded)
    {
      return false;
    }
  }
  return true;
}

void draw()
{
  background(255);
  if (!gameover)
  {
    player.update_pu();
    player.move(mouseX);
    player.draw();
    collide_pu();
    move_pu();
    draw_pu();
    collide_bullets();
    move_bullets();
    draw_bullets();
    for (int i = 0; i<N; i++)
    {
      if (aliens[i].exploaded&&(1.0*millis()-aliens[i].timeWhenExp)/1000<0.5)
      {
        aliens[i].draw();
      } else if (!aliens[i].exploaded)
      {
        aliens[i].move();
        aliens[i].draw();
      }
    }

    for(int i = 0; i< N;i++)
    {
      aliens[i].dropBomb();
      if(aliens[i].bomb!=null)
      {
        aliens[i].bomb.move();
        aliens[i].bomb.draw();
        if(aliens[i].bomb.collide(player))
        {
          gameover = true;
          player_won = false;
        }
        
      }
    }
    if(all_aliens_dead())
    {
      gameover = true;
      player_won = true;
    }
  } 
  else if(!player_won)
  {
    textFont(font);
    text("Game over",2*SCREENX/5, SCREENY/2);
  }
  else if(player_won)
  {
    textFont(font);
    text("You won",2*SCREENX/5, SCREENY/2);  
  }
}
