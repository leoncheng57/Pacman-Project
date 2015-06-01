public class Block {

  float xCor;
  float yCor;
  float fatness;
  float tallness;

  public Block(float x, float y, float w, float h) {
    rectMode(CORNER);
    rect(x, y, w, h);
    xCor = x;
    yCor = y;
  }

  public boolean checkCollision(MrPacman p) {
    //check xCor btn xCor and xCor+fatness
    //check for yCor too
    //return true or false
  }
}

