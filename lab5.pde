int x;
int c;
void setup()
{
  c = 0;
  x = 0;
  size(400,400);
  frameRate(60);
  noStroke();
  colorMode(HSB);
}

int sin(int x)
{
  return 100 + (int)(100*Math.sin(2*Math.PI*x*1.0/400));
}

void draw()
{
   background(255);
   fill(c,255,255);
   if(x>=0&&x+100<=399)
   {
     rect(x,sin(x),100,100);
   }
   else
   {
     rect(x,sin(x),400-x,100);
     rect(0,sin(x),x-300,100);
   }
   if(x++>=399)
   {
     x=0;
   }
   
   c = (c+1)%256;
 
   

}
