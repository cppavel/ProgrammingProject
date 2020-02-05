int x1;
int x2;
int c;
void setup()
{
  c = 0;
  x1 = 0;
  x2 = 350;
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
   if(x1>=0&&x1+50<=399)
   {
     fill(c,255,255);
     rect(x1,sin(x1),50,50);
     
   }
   else
   {
     fill(c,255,255);
     rect(x1,sin(x1),400-x1,50);
     rect(0,sin(x1),x1-350,50);
   }
   if(x1++>=399)
   {
     x1=0;
   }
   if(x2>=0&&x2<=350)
   {
     fill((c+100)%256,255,255);
     rect(x2,sin(x2)+100, 50,50);
   }
   else
   {
     fill((c+100)%256,255,255);
     rect(x2,sin(x2)+100,400-x2,50);
     rect(0,sin(x2)+100,x2-350,50);
   }
   
   if(x2--<=0)
   {
     x2 = 400;
   }
    
   
   c = (c+1)%256;
 
   

}
