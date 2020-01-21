int x1 = 0,x2 = 0;

void setup()
{
  x1=0;
  x2 = 300;
  size(400,400);
  frameRate(60);
  noStroke();
}

void draw()
{
   background(255);
   fill(255,0,0);
   
   if(x2>=0&&x2<=300)
   {
     rect(x2,100,100,100);
   }
   else
   {
     rect(x2,100,400-x2,100);
     rect(0, 100,x2-300,100);
   }
   
   if(x2--<=0)
   {
     x2 = 400;
   }
   
   if(x1>=0&&x1+100<=399)
   {
     rect(x1,200,100,100);
   }
   else
   {
     rect(x1,200,400-x1,100);
     rect(0,200,x1-300,100);
   }
   
   if(x1++>=399)
   {
     x1=0;
   }
}
