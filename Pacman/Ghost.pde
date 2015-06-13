public class Ghost extends Organism {

  boolean killable;
  private int[][] stageCopy;
  Maze m;
  
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
    setDirection('l');
    Maze m = new Maze();
  }

  public void getStageCopy(){
    if (this.getX()%50==25 && this.getY()%50==25){
      m.solve((int)this.getX(),(int)this.getY());
      stageCopy = Maze.solve((int)this.getX(), (int)this.getY());
  }
  
  public void changeDirection(){
    if (isPath((int)xCor+1,(int)yCor)) setDirection('r');
    else if (isPath((int)xCor-1,(int)yCor)) setDirection('l');
    else if (isPath((int)xCor,(int)yCor+1)) setDirection('d');
    else if (isPath((int)xCor,(int)yCor-1)) setDirection('u');
  }
  
  public boolean isPath(int x, int y){
    if (x>=0 || x<stageCopy.length || y>=0 || y<stageCopy[0].length){
      if (stageCopy[x][y] == 3)
        return true;
    }
    return false;
  }

  /** Ideas
   * make a ghosts array in Pacman class
   * 4 ghosts
   * starting pos?
   * use A star search?
   * release them at diff times?
   **/
}

