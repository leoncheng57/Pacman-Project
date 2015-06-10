import java.io.*;
import java.util.*;

public class Maze 
{
   //private char[][] stage;
  private int maxX;
  private int maxY;

  private int path=0;
  private int wall=1;
  private int me=3;
  private int exit=2;
  private int visited = 4;
  private boolean solved = false;

  private Frontier f;

  public void delay(int n) {
    try {
      Thread.sleep(n);
    } 
    catch (Exception e) {
    }
  }


  public String toString()
  {
    String s = "[2J\n";

    for (int y=0; y<maxY; y++)
    {
      for (int x=0; x<maxX; x++)
        s = s +stage[x][y];
      s=s+"\n";
    }
    return s;
  }

  /*
      solved - instance variable to indicate we're done
   
   */
  public void solve(int x, int y) {
    int[][] stageCopy=stage;
    y = (y-25)/50; //TODO: make method to do this
    x = (x-25)/50;
    if (stageCopy[x][y]==wall || 
      stageCopy[x][y]==me ||
      stageCopy[x][y]==visited ||
      solved) {
      return;
    }

    if (stageCopy[x][y]==exit) {
      //System.out.println(this);
      solved = true;
    }
    
    delay(100);
    //System.out.println(this);
    stage[x][y]=me;
    solve(x+1, y);
    solve(x-1, y);
    solve(x, y+1);
    solve(x, y-1);
    if (!solved) {
      stage[x][y]=visited;
    }
  }

  /*
      Only adds if the tx,ty spot is available path or exit
   */
  public void addToFront(int tx, int ty, Node current) {
    Node tmp = null;
    if (stage[tx][ty]=='#' || stage[tx][ty]=='$') {
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

      if (stage[cx][cy]=='$')
        break;

      stage[cx][cy]='z';

      addToFront(cx+1, cy, current);
      addToFront(cx-1, cy, current);
      addToFront(cx, cy+1, current);
      addToFront(cx, cy-1, current);

      delay(50);
      System.out.println(this);
    }

    // path recovery
    for (Node p = current.getPrev (); p != null; p = p.getPrev()) {
      stage[(int)p.getX()][(int)p.getY()] = 'P';
      delay(100);
      System.out.println(this);
    }
  }
}

