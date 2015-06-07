public class Organism {

  float xCor;
  float yCor;
  color col;
  char direction;
  float speed;
  float size;
  
  private Organism(){}  //should this be private or public?

  public Organism(float x, float y) {
    xCor = x;
    yCor = y;
  }
  
  public void drawMe() {
    fill(col);
    ellipse(xCor, yCor, size, size);
  }

  public float getSize(){
    return size;
  }

  public void setDirection(char c) {
    direction = c;
  }
  
  public char getDirection(){
   return direction; 
  }

  public float getX() {
    return xCor;
  }

  public float getY() {
    return yCor;
  }
}
