////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
/////////////////////////////////TESTING////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////
////////////////////////////////////////////////////////////////



public class Maze {

  private Frontier f;
  private int path = 0;
  private int wall = 1;
  private int me = 3;
  private int exit = 2;
  private int visited = 4;
  private boolean solved = false;
  private int[][] stageCopy;
  public int[][] stageCopy2;
  public Node nextNode; //TODO: make this public, and make its get method

  public int[][] getstageCopy2(){
    return stageCopy2;
  }
  public void solve(int x, int y) {
    copyOverStage();
    //println("should be orig"); for (int[] a:stageCopy){println(Arrays.toString(a));} println();
    //println("inside solve before solveHelper");
    solveHelper(x, y);
    //println("inside solve after solveHelper");
    //println(millis());
    //println("about to print stageCopy"); for (int[] a:stageCopy){println(Arrays.toString(a));} println();
    //println("ORIG"); for (int[] a:stage){println(Arrays.toString(a));} println();
  }

  public void copyOverStage() {
    stageCopy = new int[stage.length][stage[0].length];
    for (int c = 0; c<stage.length; c++) {
      for (int r = 0; r<stage[0].length; r++) {
        stageCopy[c][r] = stage[c][r];
      }
    }
    println("inside copyOverStage");
  }

  public void solveHelper(int x, int y) {
    println("inside solveHelper");
    int oldX = x;
    int oldY = y;
    y = (y-25)/50;
    x = (x-25)/50;
    if (x<0 || x>=stageCopy.length || y<0 || y>=stageCopy[0].length) return;
    if (stageCopy[x][y]==wall ||
      stageCopy[x][y]==me ||
      stageCopy[x][y]==visited ||
      solved)
      return;
    if (stageCopy[x][y]==exit){
      solved=true;
      stageCopy2=stageCopy;
    }
    stageCopy[x][y]=me;
     for (int[] a : stageCopy){
    println(Arrays.toString(a));
  } 
  println();
    solveHelper(oldX+50, oldY );
    solveHelper(oldX-50, oldY );
    solveHelper(oldX, oldY+50 );
    solveHelper(oldX, oldY-50 );
    if (!solved)
      stageCopy[x][y] = visited;
  }

  public int[][] getStageCopy() {
    return stageCopy;
  }

  public void bfs (int x, int y) {
    copyOverStage();
    x = (x-25)/50;
    y = (y-25)/50;
    f = new Frontier();
    f.add(new Node(x, y));
    int tx = 0, ty = 0;
    Node current = null;
    //println(f);
    while (!f.isEmpty ()) {
      current = f.remove();
      int cx = (int)current.getX();
      int cy = (int)current.getY();
      if (stageCopy[cx][cy] == exit)
        break;
      stageCopy[cx][cy]=me;
      addToFront(cx+1, cy, current);
      addToFront(cx-1, cy, current);
      addToFront(cx, cy+1, current);
      addToFront(cx, cy-1, current);
    }
    println(f);
    //maybe this will store the next location that the ghost is supposed to move to 
    nextNode=current;
    //path recovery
    for (Node p = current.getPrev (); p!=null; p = p.getPrev()) {
      stageCopy[(int)p.getX()][(int)p.getY()]=visited; //is this supposed ot be visited?
    }
    for (int[] a : stageCopy) {
      println(Arrays.toString(a));
    }
  }
  

  public void addToFront(int tx, int ty, Node current) {
    Node tmp = null;
    if (tx<0 || ty<0 || tx>=stageCopy.length || ty>=stageCopy[0].length)
      return;
    if (stageCopy[tx][ty]==path || stageCopy[tx][ty]==exit) {
      tmp = new Node(tx, ty);
      tmp.setPrev(current);
      f.add(tmp);
    }
  }
}

