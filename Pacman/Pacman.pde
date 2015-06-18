/**
 * Use SCRAP PAPER, scribble it out on PAPER first before typing in code
 * Browse Commits: https://github.com/leoncheng57/Pacman-Project/commits/master/Pacman
**/

import java.util.*;
import java.io.*;

MrPacman pac;
Reddy reddy;
BlueG blue;
OrangeCream orange;
Pinky pink;
ArrayList<Block> blocks;
ArrayList<Tile> tiles;
int score;
int timebefore=0;
/*
int[][] stage = {
    {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,}, 
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1,}, 
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1,}, 
    {1, 0, 0, 0, 1, 1, 0, 0, 1, 1, 0, 0, 1, 1,}, 
    {1, 0, 0, 0, 1, 0, 2, 0, 0, 1, 0, 5, 1, 1,}, 
    {1, 0, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1, 1,}, 
    {1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1,}, 
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1,}, 
    {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1,}, 
    {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,}, 
};
*/
int[][] stage = {
    {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,}, 
    {1, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9, 1,}, 
    {1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 1,}, 
    {1, 0, 1, 0, 1, 1, 0, 0, 1, 1, 0, 1, 0, 1,}, 
    {1, 0, 1, 0, 1, 0, 6, 5, 0, 1, 0, 1, 0, 1,}, 
    {1, 0, 1, 0, 1, 0, 7, 8, 0, 1, 0, 1, 0, 1,}, 
    {1, 0, 1, 0, 1, 1, 1, 1, 1, 1, 0, 1, 0, 1,}, 
    {1, 0, 1, 0, 0, 0, 0, 2, 0, 0, 0, 1, 0, 1,}, 
    {1, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9, 1,}, 
    {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,}, 
};

public void setup() {
  background(0);
  size(stage[0].length*50, stage.length*50);
  //initializing stuff
  pac = new MrPacman();
  reddy= new Reddy();
  blue = new BlueG();
  orange = new OrangeCream();
  pink = new Pinky();
  blocks = new ArrayList<Block>();
  tiles = new ArrayList<Tile>();

  placeBlocks();
}  

public void placeBlocks() {
  int[][] blocksGrid = stage;
  //Note: blocksGrid is a column-major array?
  for (int c= 0; c<blocksGrid.length;c++){
    for (int r=0; r<blocksGrid[0].length;r++){
      if (blocksGrid[c][r]==1)
        blocks.add(new Block(r,c));   
      else if (blocksGrid[c][r]==9)
        tiles.add(new Tile(r,c,true));      
      else
        tiles.add(new Tile(r,c,false));  
    }
  }
}


public void draw() {
  background(0); //TODO: make a var for background color and set it to that, or use an image
  drawBlocks();
  drawTiles();
  
  pac.drawMe();
  changeDirection(pac);
  move(pac);
  updatePac();
  
  if (reddy.isAlive() && !reddy.isScared()){
  reddy.drawMe();
  reddy.randomDirection();
  changeDirection(reddy);
  move(reddy);
  updateGhost(reddy);
  }
  else if (reddy.isScared()){
    reddy.badtimes();
  }
  
  if (blue.isAlive() && !blue.isScared()){
  blue.drawMe();
  blue.randomDirection();
  changeDirection(blue);
  move(blue);
  updateGhost(blue);
  }
  else if (blue.isScared()){
    blue.badtimes();
  }
  
  if(orange.isAlive() && !orange.isScared()){
  orange.drawMe();
  orange.randomDirection();
  changeDirection(orange);
  move(orange);
  updateGhost(orange);
  }
  else if (orange.isScared()){
    orange.badtimes();
  }
  
  if (pink.isAlive() && !pink.isScared()){
  pink.drawMe();
  pink.randomDirection();
  changeDirection(pink);
  move(pink);
  updateGhost(pink);
  }
  else if (pink.isScared()){
    pink.badtimes();
  }
  
  earnPoints();
  println("score: "+score);
  printStage();
  textSize(32);
  fill(#FCFC30);
  text("Score:"+score,25,480);
  
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

public void move(Organism org) {
  if (canMove(org)) org.move();
}

public boolean canMove(Organism org) {
  float size = org.getSize();
  for (Block b : blocks) {
    if (org.getDirection()=='u' && b.isColliding(org.getX(), org.getY()-size)) return false; 
    else if (org.getDirection()=='d' && b.isColliding(org.getX(), org.getY()+size)) return false; 
    else if (org.getDirection()=='r' && b.isColliding(org.getX()+size, org.getY())) return false; 
    else if (org.getDirection()=='l' && b.isColliding(org.getX()-size, org.getY())) return false;
  }
  return true;
}

//will only change direction when allowed (no more blocks in the way, in center of path)
public void changeDirection(Organism org){
  if (org.getX()%50==25 && org.getY()%50==25){
    float size = org.getSize();
    for (Block b : blocks) {
      if (org.getNextDirection()=='u' && b.isColliding(org.getX(), org.getY()-size)) return; 
      else if (org.getNextDirection()=='d' && b.isColliding(org.getX(), org.getY()+size)) return; 
      else if (org.getNextDirection()=='r' && b.isColliding(org.getX()+size, org.getY())) return; 
      else if (org.getNextDirection()=='l' && b.isColliding(org.getX()-size, org.getY())) return;
    }
    org.setDirection(org.getNextDirection());
  }
}

public void earnPoints(){
  for (Tile t:tiles){
    if (t.getX()+t.getSize()/2==pac.getX() && t.getY()+t.getSize()/2==pac.getY()){
      if (t.power && t.havePoints){
        t.eatPower();
      }
      else if (t.havePoints){
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
}


public void updateGhost(Ghost g) {
  if (g.getX()%50==25 && g.getY()%50==25) {
    for (int c= 0; c<stage.length; c++) {
      for (int r=0; r<stage[0].length; r++) {
        //println("x: "+pac.getX()+"y: "+pac.getY());
        if (stage[c][r]==g.getID()) {
          stage[c][r]=0;
          //println("r: "+r+"c: "+c);
        } if (r==(g.getX()-25)/50 && c==(g.getY()-25)/50) {
          stage[c][r]=g.getID();
        }
      }
    }
  }
}

//stores direction in the var nextDirection b/c Pacman may have to wait until it is able to change direction
public void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      pac.setNextDirection('u');
    } else if (keyCode == DOWN) {
      pac.setNextDirection('d');
    } else if (keyCode == RIGHT) {
      pac.setNextDirection('r');
    } else if (keyCode == LEFT) {
      pac.setNextDirection('l');
    }
  }
}




