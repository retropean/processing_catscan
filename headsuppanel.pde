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
    int lyriccounter = 0;
    int lyricheight = 15;
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
  }
}