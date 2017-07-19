void setup()
{
  fullScreen(2);
  noStroke();
  background(0);
}

float y1 = 20;
float x1 = 20;
float y2;
float x2;
float redind = 0;

void draw()
{
  redind = round(random(20));
  y2 = y1;
  x2 = x1;
  if (redind == 15)
  {
    fill(255, 0, 0, 180);
    println("red button");
  }
  else fill(255, 255, 255, 180);
  ellipse(x1, y1, 20, 20);
  y1 = random(height);
  x1 = random(width);
  smooth();
  //fill(0,0,0);
  if (redind == 10)
  {
    fill(255, 0, 0, 180);
    println("red fill");
  }
  else fill(0,0,0);
  stroke(255,255,255);
  //line(y1,x1,y2,x2);
  curve(40, 40, x1, y1, x2, y2, 40, 40);
  //curve(cpx1, cpy1, x1, y1, x2, y2, cpx2, cpy2);
}

void keyReleased() {
}