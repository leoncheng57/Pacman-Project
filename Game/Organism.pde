public class Organism {

  float xCor;
  float yCor;
  color col;
  char direction;
  char nextDirection;
  float speed;
  float size;
  int ID;
  boolean alive;
  boolean ready;
  
  private Organism() {
  } 
  
  public Organism(float x, float y) {
    xCor = x;
    yCor = y;
  }

  public void drawMe() {
    fill(col);
    ellipse(xCor, yCor, size, size);
  }

  public float getSize() {
    return size;
  }

  public void setDirection(char direc) {
    direction = direc;
  }

  public char getDirection() {
    return direction;
  }

  public void setNextDirection(char direc) {
    nextDirection = direc;
  }

  public char getNextDirection() {
    return nextDirection;
  }

  public float getX() {
    return xCor;
  }

  public float getY() {
    return yCor;
  }
  public void setX(float e){
    xCor=e;
  }
  public void setY(float e){
    yCor=e;
  }
  public int getID(){
    return ID;
  }
  public void setID(int x){
    ID=x;
  }
  public boolean isAlive(){
    return alive;
  }
  public void setAlive(boolean e){
    alive=e;
  }
  public boolean isReady(){
    return ready;
  }
  public void setReady(boolean e){
    ready=e;
  }

  public void move() {
    if (direction == 'u') yCor-= speed; 
    if (direction == 'd') yCor+= speed;
    if (direction == 'l') xCor-= speed;
    if (direction == 'r') xCor+= speed;
  }

  public int getSmallX() {
    return (int)((this.getX()-25)/50);
  }

  public int getSmallY() {
    return (int)((this.getY()-25)/50);
  }
  public void setColor(color e){
   col=e; 
  }
  public color getColor(){
    return col;
  }
}

