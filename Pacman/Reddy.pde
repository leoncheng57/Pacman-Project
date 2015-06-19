public class Reddy extends Ghost{
  public Reddy() {     
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
    scared=false;
    setDirection('l');
    setID(5);
    setAlive(true);
    setReady(true);
    spawnPointX=xCor;
    spawnPointY=yCor;
  } 
}
