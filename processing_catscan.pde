//SET LIST
//Portly Chap / Non Sequitur / Voodoo Dollhouse / Cakey Cakey /
//This Adventure’s Happening
//Your Government Name / Au Naturale (+ FOR DIFFERENT FONT) / Kill the Poor (Y FOR BOX) 
//Marine Biologist (USE E FOR FONT) / Stickup

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

// K: Enable circle trip

import generativedesign.*;
import processing.pdf.*;
import java.util.Calendar;

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

// Variables for Big Words
float currentSize = 5;
float bestSize = 5;
float sizeIncrement = 0.5;
String[] words;
boolean searching = true;  

// Variables for circle trip
int circletriptoggle = 0;
int tileCountX = 50;
int tileCountY = 10;
int[] hueValues = new int[tileCountX];
int[] saturationValues = new int[tileCountX];
int[] brightnessValues = new int[tileCountX];

void setup() {
  fullScreen(2);
  //size(400,200);
  frameRate(20);
  noCursor();
  colorMode(RGB,255,255,255);
  f = createFont("Lato-Regular.ttf", fs);
  
  // Initial colors for circle trip
  for (int i=0; i<tileCountX; i++) 
  {
    hueValues[i] = 195;
    saturationValues[i] = 100;
    brightnessValues[i] = (int) random(0,100);
  }
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
    f = createFont("Codystar-Regular.ttf", fs); // Dots
    //f = createFont("BungeeShade-Regular.ttf", fs); // Block
    
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