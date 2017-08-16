// Nested PApplet Class B:
public static final class HeadsUp extends PApplet
{ 
  void setup() 
  {
    textAlign(LEFT, CENTER);
  }
  void settings() 
  {
    size(500, 800, JAVA2D);
    smooth(4);
  }
  void draw() 
  {
    background(0);
    //text(lyricssorted[si]);
  }
}
/*
  if (e == 0) {
    if (width <= 400) {
      fs = 20;
    }
    textFont(f,fs);   
    fill(255);
    textAlign(CENTER);
    text(lyricssorted[si][i],x,y);
  }
*/