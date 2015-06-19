public class Node {

  float xCor;
  float yCor;
  public static final float size = 50; //correct types for this var?
  color col;
  Node prev;
  Node next;


  private Node() {
  }

  public Node(float x, float y) {
    xCor = x;
    yCor = y;
    col = #D1C8C8;
  }
  public void setPrev(Node n) {
    prev=n;
  }
  public void setNext(Node n) {
    next=n;
  }
  public Node getPrev() {
    return prev;
  }
  public Node getNext() {
    return next;
  }
  public float getX() {
    return xCor;
  }
  public float getY() {
    return yCor;
  }
  public float getSize() {
    return size;
  }
  public void drawMe() {
    rectMode(CORNER);
    fill(col);
    rect(xCor, yCor, size, size);
  }
  public String toString(){
    return "("+xCor + ", " +yCor+")";
  }
}

