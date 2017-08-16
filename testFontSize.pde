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