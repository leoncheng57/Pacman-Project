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

  public Block(float x, float y) { //x and y are like coords for blocksGrid
    xCor = x*50;
    yCor = y*50;
    fatness = 50;
    tallness = 50;
    col = #0774B9;
  }

  public void drawMe() {
    rectMode(CORNER);
    fill(col);
    rect(xCor, yCor, fatness, tallness);
  }

  public boolean isColliding(float x, float y) {
    return (x>=this.xCor &&
      x<=this.xCor+fatness &&
      y>=this.yCor &&
      y<=this.yCor+tallness);
  }
}

