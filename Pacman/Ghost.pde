public class Ghost extends Organism {

  boolean killable;
  private int[][] stageCopy;
  private Maze m;
  
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
    m = new Maze();
  }

  public void followPath(){
    if (this.getX()%50==25 && this.getY()%50==25){
      println(millis());
      println("inside followPath");
      m.solve((int)this.getY(),(int)this.getX());
      //println("x: "+this.getSmallX());
      //println("y: "+this.getSmallY());
      stageCopy = m.getStageCopy();
      //for (int[] a : stageCopy){
      //  println(Arrays.toString(a));
      //}
      changeDirection();  
      //println(this.getDirection());
    }
  }
  
  
  public void changeDirection(){
    int xCor = getSmallX();
    int yCor = getSmallY();
    if (isPath(xCor-1,yCor)) setDirection('l');
    else if (isPath(xCor+1,yCor)) setDirection('r');
    else if (isPath(xCor,yCor+1)) setDirection('d');
    else if (isPath(xCor,yCor-1)) setDirection('u');
  }
  
  public boolean isPath(int x, int y){
    if (x>=0 && x<stageCopy.length && y>=0 && y<stageCopy[0].length){
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

