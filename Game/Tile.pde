public class Tile extends Node {

  private boolean points;
  private boolean power;

  public Tile(float x, float y, boolean magic) { //x and y are like coords for blocksGrid
    xCor = x*50;
    yCor = y*50;
    col = #D1C8C8;
    points=true;
    power=false;
    if (magic) {
      power=true;
    }
  }
  
  public boolean hasPower(){
    return power;
  }
  
  public boolean hasPoints(){
    return points;
  }

  public void eatPower() {
    points=false;
    power=false;
    score+=20;
    for (Ghost g : ghosts){
      g.setScared(true);
    }
  }

  public void eatPoints() {
    points=false;
    score+=10;
  }

  public void drawMe() {
    super.drawMe();
    if (power && points) {
      fill(#A9FAAE);
      ellipse(xCor+size/2, yCor+size/2, 20, 20);
    } else if (points) {
      fill(#FCF569);
      ellipse(xCor+size/2, yCor+size/2, 10, 10);
    }
  }
}

