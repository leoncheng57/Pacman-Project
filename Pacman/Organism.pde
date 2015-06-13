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
  
  
  public void move() {
    if (direction == 'u') yCor-= speed; //change everything in this class to gets and sets? ex. getDirection()=='u'
    if (direction == 'd') yCor+= speed;
    if (direction == 'l') xCor-= speed;
    if (direction == 'r') xCor+= speed;
  }
}
