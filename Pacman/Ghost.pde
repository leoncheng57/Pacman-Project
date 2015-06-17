public class Ghost extends Organism {

  boolean killable;
  private int[][] stageCopy;
  private Maze m;

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
    m = new Maze();
  }

  public void setDirection(char direc) {
    println("inside setDirection");
    println("direction->"+direc+".");
    if ((int)direc==0) println("WHAT IS HAPPENING?");
    println(this.getDirection());
    direction = direc;
  }

  public char getDirection() {
    println("inside getDirection");
    return direction;
  }

  //Just going to try letting the ghost move randomly
  public boolean isPath(int x, int y) {
    if (x>=0 && x<stage.length && y>=0 && y<stage[0].length) {
      println("inside isPath");
      println("("+x+","+y+")  "+stage[x][y]);
      printStage();
      if (stage[x][y]==1)
        return false;
    }
    return true;
  }

  public void changeDirection() {
    Random rnd = new Random();
    int num = rnd.nextInt(4);
    println("ghost is at "+this.getSmallX()+","+this.getSmallY());
    if (num==0 && isPath(this.getSmallY()+1, this.getSmallY())) setDirection('r');
    if (num == 1 && isPath(this.getSmallX()-1, this.getSmallY())) setDirection('l');
    if (num == 2 && isPath(this.getSmallX(), this.getSmallY()+1)) setDirection('d');
    if (num == 3 && isPath(this.getSmallX(), this.getSmallY()-1)) setDirection('u');
    //    else changeDirection();
  }

  public void move() {
    if (this.getX()%50==25 && this.getY()%50==25) {
      changeDirection();
    }
    super.move();
  }


  /*
  public void followPath() {
   if (this.getX()%50==25 && this.getY()%50==25) {
   //println("inside followPath");
   //println("x: "+this.getX());
   //println("y: "+this.getY());
   //println(millis());
   m.bfs((int)this.getSmallY(), (int)this.getSmallX());
   //m.solve((int)this.getSmallY(), (int)this.getSmallX());
   //println("x: "+this.getSmallX());
   //println("y: "+this.getSmallY());
   stageCopy = m.getStageCopy();
   //for (int[] a : stageCopy) {
   //  println(Arrays.toString(a));
   //} 
   println();
   //for (int[] a : stageCopy){
   //  println(Arrays.toString(a));
   //}
   changeDirection();  
   //println(this.getDirection());
   }
   }
   
   public void changeDirection() {
   println("Ghost is at ("+this.getSmallX()+","+this.getSmallY()+")");
   if (this.getX()%50==25 && this.getY()%50==25) {
   //println("inside changeDirection");
   //for (int[] a : stage) {
   //  println(Arrays.toString(a));
   //} 
   //println();
   //      float x = m.getNextNode().getX();
   //      float y = m.getNextNode().getY();
   //      if (x<this.getX()) setDirection('l');
   //      else if (x>this.getX()) setDirection('r');
   //      else if (Y<this.getY()) setDirection('d');
   //      else if (y<this.getY()) setDirection('u');
   println("nextNode: "+m.getNextNode());
   int xCor = getSmallX();  //shouldnt this be switched x and y
   int yCor = getSmallY();
   if (isPath(xCor-1, yCor)) {
   setDirection('l');
   //stageCopy[xCor][yCor]=0;
   } else if (isPath(xCor+1, yCor)) {
   setDirection('r');
   //stageCopy[xCor][yCor]=0;
   } else if (isPath(xCor, yCor-1)) {
   setDirection('u');
   //stageCopy[xCor][yCor]=0;
   } else if (isPath(xCor, yCor+1)) {
   setDirection('d');
   //stageCopy[xCor][yCor]=0;
   }
   println("inside changeDirection");
   //println("("+xCor+","+yCor+")  "+stageCopy[(int)xCor][(int)yCor]);
   }
   }
   
   public boolean isPath(int x, int y) {
   if (x>=0 && x<stageCopy.length && y>=0 && y<stageCopy[0].length) {
   println("inside isPath");
   println("("+x+","+y+")  "+stageCopy[x][y]);
   if (stageCopy[x][y]==3)
   return true;
   }
   return false;
   }
   */
}

