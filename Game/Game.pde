import java.util.*;
import java.io.*;

MrPacman pac;
ArrayList<Ghost> ghosts;
ArrayList<Block> blocks;
ArrayList<Tile> tiles;
int score;
boolean gameWon;
int[][] stage;
int[][] stagecopy;
//PImage imgEnd;

/**
  * 0 = tile
  * 1 = block
  * 2 = pacman
  * 5/6/7/8 = ghosts
  * 9 = powerup
  **/
int[][] stage1 = {
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

int[][] stage2 = {
  {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,}, 
  {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,}, 
  {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,}, 
  {1, 0, 0, 0, 1, 1, 0, 0, 1, 1, 0, 0, 0, 1,}, 
  {1, 0, 6, 0, 1, 0, 2, 0, 0, 1, 0, 5, 0, 1,}, 
  {1, 0, 0, 0, 1, 9, 0, 0, 9, 1, 0, 0, 0, 1,}, 
  {1, 0, 7, 0, 1, 1, 1, 1, 1, 1, 0, 8, 0, 1,}, 
  {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,}, 
  {1, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9, 1,}, 
  {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,}, 
};

int[][] stage3 = {
  {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,}, 
  {1, 9, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 9, 1,}, 
  {1, 0, 1, 1, 0, 0, 2, 0, 0, 0, 1, 1, 0, 1,}, 
  {1, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1,}, 
  {1, 0, 1, 1, 0, 1, 5, 6, 1, 0, 1, 1, 0, 1,}, 
  {1, 0, 1, 1, 0, 1, 7, 8, 1, 0, 1, 1, 0, 1,}, 
  {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,}, 
  {1, 0, 1, 1, 0, 1, 1, 1, 1, 0, 1, 1, 0, 1,}, 
  {1, 9, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 9, 1,}, 
  {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,}, 
};

int[][] stage4 = {
  {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,}, 
  {1, 9, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 9, 1,}, 
  {1, 0, 1, 1, 0, 0, 2, 0, 0, 0, 1, 1, 0, 1,}, 
  {1, 0, 0, 0, 0, 1, 1, 1, 1, 0, 0, 0, 0, 1,}, 
  {1, 0, 1, 1, 0, 1, 5, 6, 1, 0, 1, 1, 0, 1,}, 
  {1, 0, 1, 1, 0, 1, 7, 8, 1, 0, 1, 1, 0, 1,}, 
  {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,}, 
  {1, 0, 1, 1, 1, 0, 1, 1, 0, 1, 1, 1, 0, 1,}, 
  {1, 0, 0, 9, 1, 0, 0, 0, 0, 1, 9, 0, 0, 1,}, 
  {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,}, 
};

int[][] stage5 = {
  {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,}, 
  {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,}, 
  {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,}, 
  {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,}, 
  {1, 7, 1, 1, 9, 1, 1, 0, 2, 1, 9, 1, 6, 1,}, 
  {1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1,}, 
  {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,},   
  {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,}, 
  {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,}, 
  {1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,}, 
};

public void setup() {
  if (stage == null && stagecopy == null){
    stage=copyOverStage(stage1);
    stagecopy=copyOverStage(stage1);
  } 
  //imgEnd = loadImage("You Win.png");
  size(stage[0].length*50, stage.length*50);
  gameWon = false;
  pac = new MrPacman();
  blocks = new ArrayList<Block>();
  tiles = new ArrayList<Tile>();
  placeBlocksTiles();
  ghosts = new ArrayList<Ghost>();
  placeGhosts();
}  

//looks through the arraylist and if there is a corresponding number, adds to another arraylist of those objects
public void placeBlocksTiles() {
  int[][] blocksGrid = stage;
  //Note: blocksGrid is a column-major array?, 
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

public void placeGhosts(){
  Ghost reddy= new Reddy();
  Ghost blue = new BlueG();
  Ghost orange = new OrangeCream();
  Ghost pink = new Pinky();
  ghosts.add(reddy);
  ghosts.add(blue);
  ghosts.add(orange);
  ghosts.add(pink);  
}

public void draw() {
  background(0); 
  drawBlocks();  
  drawTiles();
  
  pac.drawMe();
  changeDirection(pac);
  move(pac);
  updatePac();
  
  for (Ghost g : ghosts){
    g.drawMe();
    if (!g.isReady())
      g.respawn();
    if (g.isReady()){
      g.randomDirection();
      changeDirection(g);
      move(g);
      updateGhost(g);
    }
    g.killPac();
    if (g.isScared()){
      g.badtimes(); 
    }  
  }
  
    
  earnPoints();
  //println("score: "+score);
  //printStage();
  textSize(32);
  fill(#FCFC30);
  textAlign(CORNER);
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
  for(Ghost g: ghosts){
   g.setReady(false); 
  }

  return true;
}

public void endGame(){
  if (hasWon()){
    noLoop();
    background(0);
    textAlign(CENTER);
    textSize(60);
    text("You Win!", width/2, height/2);
    textSize(30);
    text("Final Score: "+score,width/2,height/2+39);
    text("Press 1, 2, 3, 4, or 5 to change the stage", width/2, height/2+70); 
    text("Click to play again!", width/2, height/2+110); 
    gameWon = true;
  }
  if (!pac.isAlive()){
    noLoop();
    background(0);
    textAlign(CENTER);
    textSize(60);
    text("You Lost!", width/2, height/2);
    textSize(30);
    text("Final Score: "+score,width/2,height/2+39);
    text("Press 1, 2, 3, 4, or 5 to change the stage", width/2, height/2+70); 
    text("Click to play again!", width/2, height/2+110); 
  }
}

public void mouseClicked(){
  if (gameWon || !pac.isAlive()){
    gameWon=false;
    for (int c= 0; c<stagecopy.length;c++){
      for (int r=0; r<stagecopy[0].length;r++){
        stage[c][r]=stagecopy[c][r];
      }
    }
    score=0;
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
  
  //CHEAT MODE
  if (key=='z'){
    for (Ghost g : ghosts){
      g.setScared(true); 
    }
  }
  
  //stages
  if (key=='1'){
    stage = copyOverStage(stage1);
    stagecopy = copyOverStage(stage1);
  }
  if (key=='2'){
    stage = copyOverStage(stage2);
    stagecopy = copyOverStage(stage2);
  }
  if (key=='3'){
    stage = copyOverStage(stage3);
    stagecopy = copyOverStage(stage3);
  }
  if (key=='4'){
    stage = copyOverStage(stage4);
    stagecopy = copyOverStage(stage4);
  }
  if (key=='5'){
    stage = copyOverStage(stage5);
    stagecopy = copyOverStage(stage5);
  }
}

public int[][] copyOverStage(int[][] orig){
  int[][] newCopy = new int[orig.length][orig[0].length];
  for (int c= 0; c<orig.length;c++){
    for (int r=0; r<orig[0].length;r++){
      newCopy[c][r]=orig[c][r];
    }
  }
  return newCopy;
}

