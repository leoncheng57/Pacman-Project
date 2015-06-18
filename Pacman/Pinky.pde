public class Pinky extends Ghost{
  public Pinky(){
    for (int c= 0; c<stage.length; c++) {
      for (int r=0; r<stage[0].length; r++) {
        if (stage[c][r]==8) {
          xCor=r*50+Node.size/2; 
          yCor=c*50+Node.size/2;
        }
      }
    }
    size = 25;
    col = #F7D4ED;
    speed = 5;  
    scared=false;
    setDirection('l');
    setID(8);
    setAlive(true);
  }
}
