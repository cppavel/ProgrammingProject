int x1,x2,y1;

void setup()
{
  x1 = 100;
  x2 = 125;
  y1 = 150;
  size(400,400);
  frameRate(7);
  noStroke();
}

void draw()
{
   background(255);
   fill(255,0,0);
   rect(x1,100,50,50);
   fill(0,0,255);
   rect(150,y1,50,50);
   fill(0,255,0);
   rect(x2,125,50,50);
   x1--;x2++;y1++;
}
