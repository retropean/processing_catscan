// Left click: Advance Lyrics
// Right click: Go back on Lyrics
// Center click: Reset Lyrics
// Q: Next song
// W: Last song

// E: Toggle Line/Box Lyric Display
// +: Extra font
// _: Jackie Chan / Au Naturale font_
// ): Default font
// z: Subtle vibrate
// x: More intense vibration

// c: Enable bubbles

// Y: Enable box
// O: Increase box vibration
// I: Decrease box vibration
// U: Blackout box
// L: Enable black box

PFont f;  // Global font variable
int fs = 40; // Font size
int i = 0; // Lyric index
int si = 0; // Song index
int e = 0; // Lyric display toggle index
int z = 0; // Intense vibration toggle index
int c = 0; // Brutally Intense vibration toggle index
int x = 0; // Text X location
int y = 0; // Text Y location

// Variables for Bubble
int bubbletoggle = 0;
int num = 150;
int[] bubblex = new int[num];
int[] bubbley = new int[num];

// Variables for Box Jiggle
float w = 20;
float h = 20;
int blackout_ind = 0;
float jiggle_amt = 0;
float color_val = 255;
int counter = 0;
int boxvibetoggle = 0;
int boxgrow = 0;
int blackboxwidth = 100;
int blackboxheight = 100;

float currentSize = 5;
float bestSize = 5;
float sizeIncrement = 0.5;
String[] words;
boolean searching = true;  

void setup() {
  fullScreen(2);
  //size(400,200);
  frameRate(20);
  noCursor();
  f = createFont("Lato-Regular.ttf", fs);
  
  //View available fonts
  //String[] fontList = PFont.list();
  //printArray(fontList);
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
  ////////////////////LINE DISPLAY\\\\\\\\\\\\\\\\\\
  if (e == 0) {
    if (width <= 400) {
      fs = 20;
    }
    textFont(f,fs);   
    fill(255);
    textAlign(CENTER);
    text(lyricssorted[si][i],x,y);
  }
  ////////////////////BOX DISPLAY\\\\\\\\\\\\\\\\\\\
  else if (e == 1) {
    
    words = lyricssorted[si][i].split(" ");
 
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
    //f = createFont("Codystar-Regular.ttf", fs); // Dots
    f = createFont("BungeeShade-Regular.ttf", fs); // Block
    
    textFont(f);   
    textSize(bestSize);
    fill(255);
    text(lyricssorted[si][i], 0, 0, width, height);
    noFill();
    
  };
}

boolean testFontSize(float s) {
  textSize(s);
  // calculate max lines
  int currentLine = 1;
  int maxLines = floor( height / g.textLeading);
  boolean fitHeight = true;
  int nextWord = 0;
 
  while (fitHeight) {
    if (currentLine > maxLines) {
      fitHeight = false;
    } else {
      String temp = words[nextWord];
      // check if single word is already too wide
      if (textWidth(temp)>width)
        return false;
 
      boolean fitWidth = true;
      // add words until string is too wide  
      while (fitWidth) {
 
        if (textWidth(temp) > width) {
          currentLine++;
          fitWidth = false;
        } else {
          if (nextWord < words.length -1) {
            nextWord++;
            temp += " "+words[nextWord];
          } else
            return true;
        }
      }
    }
  }
 
  return false;
} 
// 360/15 = 24
// 
// 600/25
// 480/20