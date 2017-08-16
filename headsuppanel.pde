public static final class HeadsUp extends PApplet
{ 
  void setup() 
  {
    textAlign(LEFT, CENTER);
  }
  void settings() 
  {
    size(700, displayHeight);
    smooth(4);
  }
  void draw() 
  {
    background(0);
    // Print lyrics
    int lyriccounter = 0;
    int lyricheight = 15;
    int controlind = 0;
    int controlheight = 30;
    String[] controls = 
    {
    "Left click: Advance Lyrics",
    "Right click: Go back on Lyrics",
    "Center click: Reset Lyrics",
    "Q: Next song",
    "W: Last song",
    "",
    "E: Toggle Line/Box Lyric Display",
    "+: Extra font",
    "_: Jackie Chan / Au Naturale font",
    "): Default font",
    "z: Subtle vibrate",
    "x: More intense vibration",
    "",
    "c: Enable bubbles",
    "",
    "Y: Enable box",
    "O: Increase box vibration",
    "I: Decrease box vibration",
    "U: Blackout box",
    "L: Enable black box"
    };
    textSize(10);
    while(lyriccounter < Globals.lyricssorted[Globals.si].length)
    {
      if(lyriccounter == Globals.i)
      {
        fill(#F5AC19);
      }
      text(Globals.lyricssorted[Globals.si][lyriccounter],20.0,lyricheight);
      ++lyriccounter;
      fill(#FFFFFF);
      lyricheight = lyricheight + 15;      
    }
    // Print controls
    while(controlind < controls.length)
    {
      text(controls[controlind],width/2,controlheight);
      controlheight = controlheight + 15;     
      ++controlind;
    }
  }
}