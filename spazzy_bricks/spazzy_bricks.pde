void setup()
{
  fullScreen(2);
  noStroke();
  
}

float w = 20;
float h = 20;
int blackout_ind = 0;
float jiggle_amt = 0;
float color_val = 255;
int counter = 0;
int boxgrow = 0;
int blackboxwidth = 100;
int blackboxheight = 100;
int box_x = width/2;
int box_y = height/2;

void draw()
{
  background(0);
  while(h < height)
  {
    while(w < width)
    {
      translate(random(-jiggle_amt,jiggle_amt), random(-jiggle_amt,jiggle_amt));
      color_val = random(255);
      fill(color_val, 21, 21, 180);
      rect(w, h, 20, 20);
      w = w+40;
    }
    w = 20;
    h = h+40;
    
    //Blackout spots
    if (blackout_ind == 1) {
      while(w < width)
      {
        translate(random(-jiggle_amt,jiggle_amt), random(-jiggle_amt,jiggle_amt));
        fill(0, 0, 0);
        rect(w, h, 20, 20);
        w = w+40;
      }
      
    w = 20;
    h = h+40*random(10);
    }
      
  }
  //Reset to default for next frame
  if (boxgrow == 1) {
    fill(0, 0, 0);
    rect(mouseX, mouseY, blackboxwidth, blackboxheight); 
    ++blackboxwidth;
    ++blackboxheight;
  }
  w = 20;
  h = 20;
}

void keyReleased() {
  if (key == 'O') {
    jiggle_amt = jiggle_amt + .1;
  }
  if (key == 'I') {
    jiggle_amt = jiggle_amt - .1;
  }
  if (key == 'U') {
    if( blackout_ind == 1){
      blackout_ind = 0;
    }
    else blackout_ind = 1;
  }
  if (key == 'L') {
    if( boxgrow == 1){
      boxgrow = 0;
      blackboxwidth = 100;
      blackboxheight = 100;
    }
    else boxgrow = 1;
    println("Make a box");
  }
}