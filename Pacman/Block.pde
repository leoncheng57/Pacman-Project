public class Block {

  float xCor;
  float yCor;

  public Block(float x, float y, float w, float h) {
    rectMode(CORNER);
    rect(x, y, w, h);
    xCor = x;
    yCor = y;
  }

  //public void checkCollision(MrPacman p) {
  //}
}

