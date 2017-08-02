void mouseReleased() {
  //////////////////LYRIC CONTROL\\\\\\\\\\\\\\\\\\\\
  if (mouseButton == LEFT){
    if (i == lyricssorted[si].length-1){
      i = i;
      currentSize = 5;
      bestSize = 5;
      searching = true;
    }
    else 
    {
      i=i+1;
      currentSize = 5;
      bestSize = 5;
      searching = true;
    }
  }
  else if (mouseButton == RIGHT){
    if (i == 0){
      i = 0;
      currentSize = 5;
      bestSize = 5;
      searching = true;
    }
    else {
      i = i-1;
      currentSize = 5;
      bestSize = 5;
      searching = true;
    }
  }
  else if (mouseButton == CENTER){
    i = 0;
    println("Resetting lyric");
  }
}

void keyReleased() { 
  ////////////////////SONG CONTROL\\\\\\\\\\\\\\\\\\\
  if (key == 'Q') {
    if (si == lyricssorted.length-1){
        si = si;
      } 
    else si=si+1;
    println("Advancing track");
   }
   if (key == 'W') {
    if (si == 0){
        si = 0;
      } 
    else si=si-1;
    println("Going back a song");
   }
   //TOGGLE BOX-LINE VIEW MODE
   if (key == 'E') {
    if (e == 0){
        e = 1;
        println("Switching to box view mode");
      } 
    else {
      e=0;
      println("Switching to line view mode");
    };
   }
   if (key == 'K') {
    if (circletriptoggle == 0){
        circletriptoggle = 1;
      } 
    else circletriptoggle=0;
    println("Enabling circle trip");
   }
   if (key == 'J') {  
    for (int i=0; i<tileCountX; i++) {
      hueValues[i] = 195;
      saturationValues[i] = 100;
      brightnessValues[i] = (int) random(0,100);
    }
  }
   //FONT CONTROL
   if (key == '+') {
    f = createFont("SourceCodePro-Regular.ttf", fs);
    println("Switch font to extra font space");
   }
   if (key == '_') {
    f = createFont("Monospaced.plain", fs);
    println("Switch font for Jackie Chan");
   }
   if (key == ')') {
    f = createFont("Lato-Regular.ttf", fs);
    println("Switch font to default font");
   }
   //KILL INTENSE VIBRATION
   if (key == 'z') {
     if (z == 1){
         z = 0;
     }
   }
   //VIBRATING BOXES
   if (key == 'Y') {
     if (boxvibetoggle == 1){
         boxvibetoggle = 0;
         println("Disable vibrating boxes");
     }
     else {
       boxvibetoggle = 1;
       println("Enable vibrating boxes");
     }
   }
   //KILL THE EVEN MORE INTENSE VIBRATION
   if (key == 'x') {
     if (c == 1){
         c = 0;
     }
   }
   //KILL BUBBLES
   if (key == 'c') {
     if (bubbletoggle == 1){
         bubbletoggle = 0;
         for (int i = num-1; i > 0; i--) {
            bubblex[i] = -40;
            bubbley[i] = -40;
          }
     }
   }
   //INCREASE BOX VIBRATION
   if (key == 'O') {
    jiggle_amt = jiggle_amt + .1;
   }
   //DECREASE BOX VIBRATION
   if (key == 'I') {
    jiggle_amt = jiggle_amt - .1;
   }
   //BOX BLACKOUT
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
void keyPressed() {
  //INTENSE VIBRATION
  if (key == 'z') {
    if (z == 0){
        z = 1;
    }
  }
  //EVEN MORE INTENSE VIBRATION
  if (key == 'x') {
    if (c == 0){
        c = 1;
    }
  }
  //BUBBLE TOGGLE
  if (key == 'c') {
    if (bubbletoggle == 0){
        bubbletoggle = 1;
    }
  }
  //DISABLE ESCAPE KEY
  if (key == ESC) { 
    key = 0; 
    println("No escape!"); 
  }
}