import java.util.*;
import java.io.*;

MrPacman pac;
Ghost reddy;
ArrayList<Block> blocks;
ArrayList<Node> nodes;
public void setup() {
  background(0);
  size(700, 500);
  //initializing stuff
  pac = new MrPacman();
  reddy= new Ghost();
  blocks = new ArrayList<Block>();
  nodes = new ArrayList<Node>();
  placeBlocks();
}  

int[][] stage1 = { //the one with the J and L logos
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1,}, 
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0,}, 
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0,}, 
    {1, 0, 0, 0, 1, 1, 0, 0, 1, 1, 0, 0, 1, 0,}, 
    {1, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1, 0,}, 
    {1, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1, 0,}, 
    {1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 1, 0,}, 
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0,}, 
    {1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0,}, 
    {0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0,}, 
};

public void placeBlocks() {
  int[][] blocksGrid = stage1;
  //Note: blocksGrid is a column-major array?
  for (int c= 0; c<blocksGrid.length;c++){
    for (int r=0; r<blocksGrid[0].length;r++){
      if (blocksGrid[c][r]==1)
        blocks.add(new Block(r,c));   
      else 
        nodes.add(new Node(r,c));
    }
  }
}

  public void draw() {
    background(0); //TODO: make a var for background color and set it to that, or use an image
    
    reddy.drawMe();
    drawBlocks();
    drawNodes();
    pac.drawMe();
    move();
  }

  public void drawBlocks() {
    for (Block b : blocks) {
      b.drawMe();
    }
  }
  public void drawNodes(){
    for (Node n : nodes){
        n.drawMe();
    }
  }

  public void move() {
    if (canMove()) pac.move();
  }

  public boolean canMove() {
    float size = pac.getSize();
    if (pac.getX()%50==0 && pac.getY()%50==0){
      for (Block b : blocks) {
        if (pac.getDirection()=='u' && b.isColliding(pac.getX(), pac.getY()-size/2)) return false; 
        else if (pac.getDirection()=='d' && b.isColliding(pac.getX(), pac.getY()+size/2)) return false; 
        else if (pac.getDirection()=='r' && b.isColliding(pac.getX()+size/2, pac.getY())) return false; 
        else if (pac.getDirection()=='l' && b.isColliding(pac.getX()-size/2, pac.getY())) return false;
      }
       return true;
    }
   return false;
  }

  public void keyPressed() {
    if (key == CODED) {
      if (keyCode == UP) {
        pac.setDirection('u');
      } else if (keyCode == DOWN) {
        pac.setDirection('d');
      } else if (keyCode == RIGHT) {
        pac.setDirection('r');
      } else if (keyCode == LEFT) {
        pac.setDirection('l');
      }
    }
  }

