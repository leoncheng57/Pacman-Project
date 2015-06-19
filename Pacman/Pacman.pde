/**
 * Use SCRAP PAPER, scribble it out on PAPER first before typing in code
 * Browse Commits: https://github.com/leoncheng57/Pacman-Project/commits/master/Pacman
**/

import java.util.*;
import java.io.*;

MrPacman pac;
ArrayList<Ghost> ghosts;
ArrayList<Block> blocks;
ArrayList<Tile> tiles;
int score;
boolean gameWon;
//PImage wonImage;

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
*/
int[][] stage = {
  {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,}, 
  {1, 7, 0, 0, 0, 0, 9, 0, 2, 1, 1, 1, 1, 1,}, 
  {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,}, 
};
/**
  * 0 = tile
  * 1 = block
  * 2 = pacman
  * 5/6/7/8 = ghosts
  * 9 = powerup
  **/

public void setup() {
  //wonImage = loadImage("You Win.png");
  gameWon = false;
  size(stage[0].length*50, stage.length*50);
  //initializing stuff
  pac = new MrPacman();
  blocks = new ArrayList<Block>();
  tiles = new ArrayList<Tile>();
  placeBlocks();
  ghosts = new ArrayList<Ghost>();
  Ghost reddy= new Reddy();
  Ghost blue = new BlueG();
  Ghost orange = new OrangeCream();
  Ghost pink = new Pinky();
  ghosts.add(reddy);
  ghosts.add(blue);
  ghosts.add(orange);
  ghosts.add(pink);
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
  
  for (Ghost g : ghosts){
    g.drawMe();
    g.randomDirection();
    changeDirection(g);
    move(g);
    updateGhost(g);
    if (g.isScared()){
      g.badtimes(); 
    }  
  }
  
    
  earnPoints();
  println("score: "+score);
  //printStage();
  textSize(32);
  fill(#FCFC30);
  text("Score:"+score,25,480);
  
  endGame();
}

public void normalAction(Ghost g){
  g.drawMe();
  g.randomDirection();
  changeDirection(g);
  move(g);
  updateGhost(g);
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
      if (t.hasPower() && t.hasPoints()){
        t.eatPower();
      }
      else if (t.hasPoints()){
        t.eatPoints();
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

public boolean hasWon(){
  for (Tile t : tiles){
    if (t.hasPower() || t.hasPoints()){
      return false; 
    }
  } 
  return true;
}

public void endGame(){
  if (hasWon()){
    //noLoop();
    background(0);
    textAlign(CENTER);
    textSize(60);
    text("You Win!", width/2, height/2);
    textSize(30);
    text("Click to play again!", width/2, height/2+30); 
    //blocks = null;
    //ghosts = null;
    //tiles = null;
    //score = 0;
    //pac = null;
    gameWon = true;
  }
}

public void mouseClicked(){
  if (gameWon){
    setup(); 
    loop();
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




