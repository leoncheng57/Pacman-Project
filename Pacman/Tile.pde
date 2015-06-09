public class Tile extends Node {
  boolean havePoints;
  public Tile(float x, float y) { //x and y are like coords for blocksGrid
    xCor = x*50;
    yCor = y*50;
    col = #D1C8C8;
    havePoints=true;
  }

  public void noPoints() {
    havePoints=false;
    score++;
  }
  public void drawMe() {
    super.drawMe();
    if (havePoints) {
      fill(#FCF569);
      ellipse(xCor+size/2, yCor+size/2, 10, 10);
    }
  }
}


