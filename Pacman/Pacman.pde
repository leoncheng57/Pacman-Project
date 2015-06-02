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
  blocks.add(new Block(50, 50, 50, 50));
}  

public void draw() {
  background(0); //TODO: make a var for background color and set it to that, or use an image
  pac.drawMe();
  pac.move();
  drawBlocks();
}

public void drawBlocks() {
  for (Block b : blocks) {
    b.drawMe();
  }
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

