public class Maze {
  private int path=0;
  private int wall=1;
  private int me=3;
  private int exit=2;
  private int visited = 4;
  private boolean solved = false;
  private int[][] stageCopy;

  private Frontier f;

  public Maze(){
  }

  public void copyOverStage(){
    stageCopy = new int[stage.length][stage[0].length];
    for (int c= 0; c<stage.length; c++) {
      for (int r=0; r<stage[0].length; r++) {
         stageCopy[c][r] = stage[c][r];
      }
    }
  }  

  public void solve(int x, int y){
    copyOverStage();
    //println("should be orig"); for (int[] a:stageCopy){println(Arrays.toString(a));} println();
    solveHelper(x,y);
    //println("COPY"); for (int[] a:stageCopy){println(Arrays.toString(a));} println();
    println("ORIG"); for (int[] a:stage){println(Arrays.toString(a));} println();
  }
  
  public void solveHelper(int x, int y){  
    int oldX = x;
    int oldY = y;
    y = (y-25)/50;
    x = (x-25)/50;
    if (x<0 || x>=stageCopy.length || y<0 || y>=stageCopy[0].length){
      return;
    }
   // println("and here");
    if (stageCopy[x][y]==wall || 
      stageCopy[x][y]==me ||
      stageCopy[x][y]==visited ||
      solved) {
      return;
    }
   // println("down here");
    if (stageCopy[x][y]==exit) {
      //System.out.println(this);
      solved = true;
    }
    //delay(100);
    //System.out.println(this);
    stageCopy[x][y]=me;
    //println("im running solve!" + millis());
    //TODO: convertind numbers ERROR , have to fix
    solveHelper(oldX+50, oldY );
    solveHelper(oldX-50, oldY );
    solveHelper(oldX, oldY+50 );
    solveHelper(oldX, oldY-50 );
    if (!solved) {
      stageCopy[x][y]=visited;
    }
    /*println("im here!" + millis());
    for (int[] a : stageCopy){
      println(Arrays.toString(a));
    }
    println();*/
    //printing below:
    //for (int[] a : stageCopy){
    //  println(Arrays.toString(a));
    //}
    //println(millis());
    //println();
  }

  /*
      Only adds if the tx,ty spot is available path or exit
   */
  public void addToFront(int tx, int ty, Node current) {
    Node tmp = null;
    if (stageCopy[tx][ty]=='#' || stageCopy[tx][ty]=='$') {
      tmp = new Node(tx, ty);
      tmp.setPrev(current);
      f.add(tmp);
    }
  }

  public void bfs(int x, int y) {
    f = new Frontier(); // queue
    //f = new StackFront();
    f.add(new Node(x, y));
    int tx=0, ty=0;
    Node current = null;
    while (!f.isEmpty ()) {
      current = f.remove();
      int cx = (int)current.getX();
      int cy = (int)current.getY();
      if (stageCopy[cx][cy]=='$')
        break;
      stageCopy[cx][cy]='z';
      addToFront(cx+1, cy, current);
      addToFront(cx-1, cy, current);
      addToFront(cx, cy+1, current);
      addToFront(cx, cy-1, current);
      delay(50);
      System.out.println(this);
    }
    // path recovery
    for (Node p = current.getPrev (); p != null; p = p.getPrev()) {
      stageCopy[(int)p.getX()][(int)p.getY()] = 'P';
      delay(100);
      System.out.println(this);
    }
  }
  
  public int[][] getStageCopy(){
    return stageCopy;
  }

  
}

