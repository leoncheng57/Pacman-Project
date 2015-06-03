public class MrPacman extends Organism {

  float xCor;
  float yCor;
  color col;
  char direction;
  float speed;
  float size;

  public MrPacman() {
    xCor = width/2; //starting position may be edited later
    yCor = height/2;
    col = #FFE834;
    size = 25;
    speed = 5;
  }

  public void drawMe() {
    fill(col);
    ellipse(xCor, yCor, size, size);
  }

  public void move() {
    if (direction == 'u') yCor-= speed;
    if (direction == 'd') yCor+= speed;
    if (direction == 'l') xCor-= speed;
    if (direction == 'r') xCor+= speed;
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

