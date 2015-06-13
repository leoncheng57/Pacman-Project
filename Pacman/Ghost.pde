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
    setDirection('l');
  }
  public void getPathReady(){
     path = m.getPath((int)xCor,(int)yCor);
  }
  public void updatePath(){
    if (this.getX()%50==25 && this.getY()%50==25){
      m.solve((int)this.getX(),(int)this.getY());
      getPathReady();
    }
  }
  public void move() {
    if (direction == 'u') yCor-= speed; //change everything in this class to gets and sets? ex. getDirection()=='u'
    if (direction == 'd') yCor+= speed;
    if (direction == 'l') xCor-= speed;
    if (direction == 'r') xCor+= speed;
  }
  public void changeDirection(){
    if (path[(int)xCor+1][(int)yCor]==3){
      setDirection('r');
    }
    else if (path[(int)xCor-1][(int)yCor]==3){
      setDirection('l'); 
    }
    else if (path[(int)xCor][(int)yCor+1]==3){
      setDirection('d');
    }
    else if (path[(int)xCor][(int)yCor-1]==3){
      setDirection('u');
    }
  }
  /** Ideas
   * make a ghosts array in Pacman class
   * 4 ghosts
   * starting pos?
   * use A star search?
   * release them at diff times?
   **/
}

