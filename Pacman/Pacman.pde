/**
 * Use SCRAP PAPER, scribble it out on PAPER first before typing in code
 * Browse Commits: https://github.com/leoncheng57/Pacman-Project/commits/master/Pacman
**/

import java.util.*;
import java.io.*;

MrPacman pac;
Ghost reddy;
ArrayList<Block> blocks;
ArrayList<Tile> tiles;
Maze m = new Maze();
char nextDirection;
int score;


public void setup() {
  background(0);
  size(700, 500);
  //initializing stuff
  pac = new MrPacman();
  reddy= new Ghost();
  blocks = new ArrayList<Block>();
  tiles = new ArrayList<Tile>();
  placeBlocks();
  
}  

int[][] stage = { //the one with the J and L logos
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1,}, 
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1,}, 
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1,}, 
    {1, 0, 0, 0, 1, 1, 0, 0, 1, 1, 0, 0, 1, 1,}, 
    {1, 0, 0, 0, 1, 0, 2, 0, 5, 1, 0, 0, 1, 1,}, 
    {1, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1, 1,}, 
    {1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1,}, 
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1,}, 
    {1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1,}, 
    {0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1,}, 
};

public void placeBlocks() {
  int[][] blocksGrid = stage;
  //Note: blocksGrid is a column-major array?
  for (int c= 0; c<blocksGrid.length;c++){
    for (int r=0; r<blocksGrid[0].length;r++){
      if (blocksGrid[c][r]==1)
        blocks.add(new Block(r,c));   
      else
        tiles.add(new Tile(r,c));
        
    }
  }
}

public void draw() {
  background(0); //TODO: make a var for background color and set it to that, or use an image
  drawBlocks();
  drawTiles();
  
  pac.drawMe();
  reddy.drawMe();
  changeDirection();
  move();
  earnPoints();
  //println("score: "+score);
  updatePac();
  
  m.solve(225,275);
  
  //m.solve((int)reddy.getX(),(int)reddy.getY());
  //printStage();
}

public void printStage(){
  for (int[] a : stage){
    println(Arrays.toString(a));
  } 
  println();
}

public void drawBlocks() {
  for (Block b : blocks) {
    b.drawMe();
  }
}
  
public void drawTiles(){
  for (Tile t : tiles){
    t.drawMe();
  }
}

public void move() {
  if (canMove()) pac.move();
}

public boolean canMove() {
  float size = pac.getSize();
  for (Block b : blocks) {
    if (pac.getDirection()=='u' && b.isColliding(pac.getX(), pac.getY()-size)) return false; 
    else if (pac.getDirection()=='d' && b.isColliding(pac.getX(), pac.getY()+size)) return false; 
    else if (pac.getDirection()=='r' && b.isColliding(pac.getX()+size, pac.getY())) return false; 
    else if (pac.getDirection()=='l' && b.isColliding(pac.getX()-size, pac.getY())) return false;
  }
  return true;
}

//will only change direction when allowed (no more blocks in the way, in center of path)
public void changeDirection(){
  if (pac.getX()%50==25 && pac.getY()%50==25){
    float size = pac.getSize();
    for (Block b : blocks) {
      if (nextDirection=='u' && b.isColliding(pac.getX(), pac.getY()-size)) return; 
      else if (nextDirection=='d' && b.isColliding(pac.getX(), pac.getY()+size)) return; 
      else if (nextDirection=='r' && b.isColliding(pac.getX()+size, pac.getY())) return; 
      else if (nextDirection=='l' && b.isColliding(pac.getX()-size, pac.getY())) return;
    }
    pac.setDirection(nextDirection);
  }
}

public void earnPoints(){
  for (Tile t:tiles){
    if (t.getX()+t.getSize()/2==pac.getX() && t.getY()+t.getSize()/2==pac.getY()){
      if (t.havePoints){
      t.noPoints();
      }
    }
  } 
}


public void updatePac() {
  if (pac.getX()%50==25 && pac.getY()%50==25) {
    for (int c= 0; c<stage.length; c++) {
      for (int r=0; r<stage[0].length; r++) {
        //println("x: "+pac.getX()+"y: "+pac.getY());
        if (stage[c][r]==2) {
          stage[c][r]=0;
          //println("r: "+r+"c: "+c);
        } if (r==(pac.getX()-25)/50 && c==(pac.getY()-25)/50) {
          stage[c][r]=2;
        }
      }
    }
  }
//  for(int[] a : stage){
//    println(Arrays.toString(a));
//  }
//  println();
}


//stores direction in the var nextDirection b/c Pacman may have to wait until it is able to change direction
public void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      nextDirection='u';
    } else if (keyCode == DOWN) {
      nextDirection='d';
    } else if (keyCode == RIGHT) {
      nextDirection='r';
    } else if (keyCode == LEFT) {
      nextDirection='l';
    }
  }
}

