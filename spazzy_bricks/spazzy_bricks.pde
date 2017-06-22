void setup()
{
  fullScreen(2);
  noStroke();
}

int w = 20;
int h = 20;
int color_ind = 0;

void draw()
{
  background(0);
  while(h < height)
  {
    while(w < width)
    {
      if (color_ind == 1) {
        translate(random(-.1,.1), random(-.1,.1));
      }
      fill(random(255), 255, random(255), 128);
      rect(w, h, 20, 20);
      w = w+40;
    }
    w = 20;
    h = h+40;
  }
  w = 20;
  h = 20;
}

void keyReleased() {
  if (key == 'P') {
    if (color_ind == 1) {
      color_ind = 0;
    }
    else color_ind = 1;
  }
}