import java.util.*;
import java.io.*;

MrPacman pac;
ArrayList<Block> blocks;

public void setup() {
  background(0);
  size(700, 500);

  //initializing stuff
  pac = new MrPacman();
  blocks = new ArrayList<Block>();

  //testing stuff
  //blocks.add(new Block(50, 50, 50, 50));
  blocks.add(new Block(2,2));
  blocks.add(new Block(50, 400, 50, 50));
  blocks.add(new Block(500, 50, 50, 50));
  blocks.add(new Block(500, 400, 50, 50));
}  

public void draw() {
  background(0); //TODO: make a var for background color and set it to that, or use an image
  pac.drawMe();
  drawBlocks();
  move();
}

public void drawBlocks() {
  for (Block b : blocks) {
    b.drawMe();
  }
}

public void move() {
  if (canMove()) pac.move();
}

public boolean canMove() {
  float size = pac.getSize();
  for (Block b : blocks) {
    //TODO: 
    if (pac.getDirection()=='u' && b.isColliding(pac.getX(), pac.getY()-size/2)) return false; 
    else if (pac.getDirection()=='d' && b.isColliding(pac.getX(), pac.getY()+size/2)) return false; 
    else if (pac.getDirection()=='r' && b.isColliding(pac.getX()+size/2, pac.getY())) return false; 
    else if (pac.getDirection()=='l' && b.isColliding(pac.getX()-size/2, pac.getY())) return false;
  }
  return true;
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

