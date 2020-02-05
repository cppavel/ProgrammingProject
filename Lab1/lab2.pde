int x;

void setup()
{
  x=0;
  size(400,400);
  frameRate(60);
  noStroke();
}

void draw()
{
   background(255);
   fill(255,0,0);
   rect(x,200,100,100);
   if(x++>=399)
   {
     x = 0;
   }
}
