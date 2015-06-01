import java.util.*;
import java.io.*;

MrPacman pac;

void setup() {
  background(0);
  size(700, 500);
  //Block b = new Block(50,50,50,50);
  Character c = new Character(50, 50);
  pac = new MrPacman();
}  

void draw() {
  background(0); //TODO: make a var for background color and set it to that, or use an image
  pac.drawMe();
  pac.move();
}


void keyPressed() {
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

