public class Node{
  
  float xCor;
  float yCor;
  public static final float size = 50; //correct types for this var?
  color col;
  private Node(){}

  public Node(float x, float y) { //x and y are like coords for blocksGrid
    xCor = x*50;
    yCor = y*50;
    col = #D1C8C8;
    
  }
  public float getX(){
    return xCor;
  }
  public float getY(){
    return yCor;
  }
  public float getSize(){
    return size; 
  }
  public void drawMe() {
    rectMode(CORNER);
    fill(col);
    rect(xCor, yCor, size, size);
    
  }
}
