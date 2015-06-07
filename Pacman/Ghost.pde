public class Ghost extends Organism {

  boolean killable;

  public Ghost(){
    xCor=width/2+20;
    yCor=height/2;
    col=#b22222;
    size=25;
    speed=5;
    killable=false;
  }
    
  /** Ideas
   * make a ghosts array in Pacman class
   * 4 ghosts
   * starting pos?
   * use A star search?
   * release them at diff times?
   **/
}

