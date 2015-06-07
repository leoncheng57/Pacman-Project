public class Block {

  float xCor;
  float yCor;
  float size;
  color col;

  public Block(float x, float y, float s) {
    xCor = x;
    yCor = y;
    size = s;
    col = #0774B9;
  }

  public Block(float x, float y) { //x and y are like coords for blocksGrid
    xCor = x*50;
    yCor = y*50;
    size = 50;
    col = #0774B9;
  }

  public void drawMe() {
    rectMode(CORNER);
    fill(col);
    rect(xCor, yCor, size, size);
  }

  public boolean isColliding(float x, float y) {
    return (x>=this.xCor &&
      x<=this.xCor+size &&
      y>=this.yCor &&
      y<=this.yCor+size);
  }
}

