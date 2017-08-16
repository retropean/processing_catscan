final PApplet headsupwindow = new HeadsUp();
 
void setup() {
  smooth(4);
  frameRate(20);
  noCursor();
  colorMode(RGB, 255, 255, 255);
  f = createFont("Lato-Regular.ttf", fs);
  
  // Initial colors for circle trip
  for (int i=0; i<tileCountX; i++) 
  {
    hueValues[i] = 195;
    saturationValues[i] = 100;
    brightnessValues[i] = (int) random(0,100);
  }
 
  // Instantiating All Nested PApplet Sketches:
  String[] sketches = getSketchNestedClassNames();
  //for (String sketch : sketches)  main(sketch);
  printArray(sketches);
 
  //runSketch(new String[] { ARGS_FULL_SCREEN, "Full Window" }, another);
  //runSketch(new String[] { "My Hello Window" }, another);
  runSketch(new String[] { "My HeadsUp Window" }, headsupwindow);
}
 
void settings() {
    fullScreen(2);
}
 
void draw() {
  
  background(0);
  x = width/2;
  y = height/2; 
  //////////////////BOX JIGGLE\\\\\\\\\\\\\\\\\\
  if (boxvibetoggle == 1) { 
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
    if (boxgrow == 1) 
    {
      fill(0, 0, 0);
      rect(mouseX, mouseY, blackboxwidth, blackboxheight); 
      ++blackboxwidth;
      ++blackboxheight;
    }
    w = 20;
    h = 20;
  }
  ////////////////////BUBBLE\\\\\\\\\\\\\\\\\\\\
  if (bubbletoggle == 1) { 
    for (int i = num-1; i > 0; i--) {
      bubblex[i] = bubblex[i-1];
      bubbley[i] = bubbley[i-1];
    }
    // Add the new values to the beginning of the array
    bubblex[0] = mouseX;
    bubbley[0] = mouseY;
    // Draw the circles
    for (int i = 0; i < num; i++) {
      fill(255-i,255-i,255-i);
      ellipse(bubblex[i], bubbley[i], i/2.0, i/2.0);
    }
  }
  ////////////////GENTLE VIBRATION\\\\\\\\\\\\\\\\
  if (z == 1) {
    x += random(-2, 2);
    y += random(-2, 2);
  }
  //////////////////INTENSE VIBRATION\\\\\\\\\\\\\\
  if (c == 1) {
    x += random(-8, 8);
    y += random(-8, 8);
  }
  
  if (circletriptoggle == 1) 
  {
    colorMode(HSB,360,100,100,100);
    noStroke();
    int counter = 0;
    // map mouse to grid resolution
    // map/scale mouse (mouse to screen size) to number of tile counts 
    // (1 to the max number of tiles set above) 
    int currentTileCountX = (int) map(mouseX, 0, width, 1,tileCountX);
    int currentTileCountY = (int) map(mouseY, 0, height, 1,tileCountY);
    float tileWidth = width / (float) currentTileCountX;
    float tileHeight = height / (float) currentTileCountY;
    
    for (int gridY=0; gridY< tileCountY; gridY++) 
    {
      for (int gridX=0; gridX< tileCountX; gridX++) {  
        float posX = tileWidth*gridX;
        float posY = tileHeight*gridY;
        int index = counter % currentTileCountX;
  
        // get component color values
        fill(hueValues[index],saturationValues[index],brightnessValues[index]);
        ellipse(posX, posY, tileWidth, tileHeight);
        counter++;
      } 
    }
  }
  if (circletriptoggle == 0) 
  {
    // Reset color mode
    colorMode(RGB,255,255,255);
  }
  ////////////////////LINE DISPLAY\\\\\\\\\\\\\\\\\\
  if (e == 0) {
    if (width <= 400) {
      fs = 20;
    }
    textFont(f,fs);   
    fill(255);
    textAlign(CENTER);
    text(Globals.lyricssorted[Globals.si][Globals.i],x,y);
  }
  ////////////////////BOX DISPLAY\\\\\\\\\\\\\\\\\\\
  else if (e == 1) {
    
    words = Globals.lyricssorted[Globals.si][Globals.i].split(" ");
 
    searching = true;
    while(searching){
      if(testFontSize(currentSize)){
        bestSize = currentSize;
        currentSize += sizeIncrement;
        println("searching!");
      }
      else
      {
        searching = false;
      }
    }
    println("Best size: "+ bestSize);
    //f = createFont("Ewert-Regular.ttf", fs); // Western Look
    //f = createFont("Fascinate-Regular.ttf", fs); // 60's look
    f = createFont("Codystar-Regular.ttf", fs); // Dots
    //f = createFont("BungeeShade-Regular.ttf", fs); // Block
    
    textFont(f);   
    textSize(bestSize);
    fill(255);
    text(Globals.lyricssorted[Globals.si][Globals.i], 0, 0, width, height);
    noFill();
  };
}

// Util Functions for Hiding/Displaying/Toggling Sketches:
static final void disableSketch(PApplet p) {
  p.frame.hide();
  p.noLoop();
}
 
static final void activateSketch(PApplet p) {
  p.frame.show();
  p.loop();
}
 
static final void toggleSketch(PApplet p) {
  boolean isActive = p.frame.isVisible();
  //p.frame.setVisible(!isActive);
  p.getSurface().setVisible(!isActive);
  if (isActive)  p.noLoop();
  else           p.loop();
}
 
// Util Functions for Nested PApplet Sketches:
static final String getSketchClassName() 
{
  return Thread.currentThread().getStackTrace()[1].getClassName();
}
 
static final String[] getSketchNestedClassNames() 
{
  Class[] nested;
  try 
  {
    nested = Class.forName(getSketchClassName()).getClasses();
  }
  catch (ClassNotFoundException cause) 
  {
    throw new RuntimeException(cause);
  }
 
  int idx = 0, len = max(0, nested.length - 2);
  String[] classes = new String[len];
 
  while (idx != len)  classes[idx] = nested[idx++].getName();
  return classes;
}