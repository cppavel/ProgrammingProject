Player thePlayer;
Player computerPlayer;
Ball theBall;
boolean stop = false;
boolean gameover = false;
PFont myFont;
PFont f;
int res;
boolean plC = false, cC =true;
int time = millis();
int count = 1;
void settings(){
size(SCREENX, SCREENY);
}
void setup(){

frameRate(60);
myFont  = loadFont("Calibri-18.vlw");
f = loadFont("Calibri-36.vlw");
computerPlayer = new Player(MARGIN,false);
computerPlayer.isPlayer = false;
thePlayer = new Player(SCREENY-PADDLEHEIGHT-MARGIN,true);
theBall = new Ball();
ellipseMode(RADIUS);
}

void mousePressed()
{
  if(stop)
  {
    computerPlayer.speed = 2;
    time = millis();
    count = 1;
    theBall.dx = random(1,2);
    theBall.dy = random(1,2);
    stop = false;
    gameover = false;
    plC = false; cC =true;
  }
}

int checkGameOver()
{
  if(thePlayer.wins == 3)
  {
    return 1;
  }
  else if (computerPlayer.wins == 3)
  {
    return -1;
  }
  else
  {
    return 0;
  }
  
}
void draw() {
background(0);
if(!gameover)
{
  if(!stop)
  {
    if((millis() - time)/15000>=count)
    {
      theBall.updateSpeed();
      computerPlayer.updateSpeed();
      count++;
    }
    theBall.move();
    thePlayer.score(Math.round(theBall.y));
    computerPlayer.score(Math.round(theBall.y));
    textFont(myFont);
    fill(255);
    res =checkGameOver();
    if(res!=0)
    {
      gameover = true;
    }
    stop = theBall.reset();
    computerPlayer.computerMove((int)theBall.x);
    thePlayer.move(mouseX);
  }
  fill(theBall.ballColor);
  text("Player " + thePlayer.wins +":"+computerPlayer.wins +" Computer",20,MARGIN + 2 * PADDLEHEIGHT);
  text("Current Speed: " + count,20,MARGIN + 3 * PADDLEHEIGHT);
  
  theBall.collideWall();
  if(cC)
  {
    plC = theBall.collide(thePlayer);
    
  }
  if(plC)
  {
    cC = theBall.collide(computerPlayer);
  
  }
  theBall.draw();
  computerPlayer.draw();
  thePlayer.draw();
}
else
{
  textFont(f);
  fill(theBall.ballColor);
  if(res==1)
  {
    text("Player won", SCREENX/3, SCREENY/2);
    thePlayer.wins = 0;
    computerPlayer.wins = 0;
  }
  else if(res ==-1)
  {
    text("Computer won", SCREENX/3, SCREENY/2);
    thePlayer.wins = 0;
    computerPlayer.wins = 0;
  }
}

}
