public class MrPacman extends Organism {

  public MrPacman() {
     
    for (int c= 0; c<stage.length; c++) {
      for (int r=0; r<stage[0].length; r++) {
        if (stage[c][r]==2) {
          xCor=r*50+Node.size/2; 
          yCor=c*50+Node.size/2;
        }
      }
    }
    size = 25;
    col = #FFE834;
    speed = 5;
    setID(2);
  }

}

