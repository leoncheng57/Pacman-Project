public class Block {

  float xCor;
  float yCor;
  float fatness;
  float tallness;
  color col;

  public Block(float x, float y, float w, float h) {
    xCor = x;
    yCor = y;
    fatness = w;
    tallness = h;
    col = #0774B9;
  }
  
  public void drawMe() {
    rectMode(CORNER);
    fill(col);
    rect(xCor, yCor, fatness, tallness);
  }

  public boolean isColliding(MrPacman p) {
    return (p.getX()>=this.xCor &&
      p.getX()<=this.xCor+fatness &&
      p.getY()>=this.yCor &&
      p.getY()<=this.yCor+tallness);
  }
}

