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
  return 100 + (int)(100*Math.sin(2*Math.PI*x*1.0/200));
}

void draw()
{
   background(255);
   if(x>=0&&x+50<=399)
   {
     fill(c,255,255);
     rect(x,sin(x),50,50);
     fill((c+100)%256,255,255);
     rect(x,sin(x)+100, 50,50);
   }
   else
   {
     fill(c,255,255);
     rect(x,sin(x),400-x,50);
     rect(0,sin(x),x-350,50);
     
     fill((c+100)%256,255,255);
     rect(x,sin(x)+100,400-x,50);
     rect(0,sin(x)+100,x-350,50);
   }
   if(x++>=399)
   {
     x=0;
   }
   
   c = (c+1)%256;
 
   

}
