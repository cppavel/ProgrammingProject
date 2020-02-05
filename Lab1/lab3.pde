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
   if(x>=0&&x+100<=399)
   {
     rect(x,200,100,100);
   }
   else
   {
     rect(x,200,400-x,100);
     rect(0,200,x-300,100);
   }
   if(x++>=399)
   {
     x=0;
   }
   

}
