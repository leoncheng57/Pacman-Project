public class Ghost extends Organism {

  boolean killable;
  private int[][] path;
  public Ghost(){
     
    for (int c= 0; c<stage.length; c++) {
      for (int r=0; r<stage[0].length; r++) {
        if (stage[c][r]==5) {
          xCor=r*50+Node.size/2; 
          yCor=c*50+Node.size/2;
        }
      }
    }
    size = 25;
    col = #b22222;
    speed = 5;
  
    killable=false;
  }
  public void getPathReady(){
     path = m.getPath();
  }
  public void move() {
    if (direction == 'u') yCor-= speed; //change everything in this class to gets and sets? ex. getDirection()=='u'
    if (direction == 'd') yCor+= speed;
    if (direction == 'l') xCor-= speed;
    if (direction == 'r') xCor+= speed;
  }
  /** Ideas
   * make a ghosts array in Pacman class
   * 4 ghosts
   * starting pos?
   * use A star search?
   * release them at diff times?
   **/
}

