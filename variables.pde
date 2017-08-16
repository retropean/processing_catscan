import generativedesign.*;
import processing.pdf.*;
import java.util.Calendar;

PFont f;  // Global font variable
int fs = 40; // Font size

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