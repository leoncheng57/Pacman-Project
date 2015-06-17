public class Ghost extends Organism {

  boolean scared;
  private int[][] stageCopy;

  public Ghost() {     
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
  
  public void randomDirection(){
    Random rnd = new Random();
    int num = rnd.nextInt(4);
    if (num == 0) setNextDirection('d');
    else if (num == 1) setNextDirection('u');
    else if (num == 2) setNextDirection('l');
    else if (num == 3) setNextDirection('r'); 
  }  
}
