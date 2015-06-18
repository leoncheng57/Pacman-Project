public class Tile extends Node {
  boolean havePoints;
  boolean power;
  public Tile(float x, float y, boolean magic) { //x and y are like coords for blocksGrid
    xCor = x*50;
    yCor = y*50;
    col = #D1C8C8;
    havePoints=true;
    power=false;
    if (magic){
      power=true;
    }
  }
  public void eatPower(){
    havePoints=false;
    power=false;
    score+=10;
     int timeB4=millis();
    
      
   
    reddy.killable();
    blue.killable();
    orange.killable();
    pink.killable();
    
  }
  public void noPoints() {
    havePoints=false;
    score++;
  }
  public void drawMe() {
    super.drawMe();
    if (power && havePoints){
      fill(#A9FAAE);
      ellipse(xCor+size/2, yCor+size/2, 20, 20);
    }
    else if(havePoints){
      fill(#FCF569);
      ellipse(xCor+size/2, yCor+size/2, 10, 10);
    }
    
  }
}

