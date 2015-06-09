public class MrPacman extends Organism {

  public MrPacman() {
    for (int c= 0; c<stage.length; c++) {
      for (int r=0; r<stage[0].length; r++) {
        if (stage[c][r]=2) {
          xCor=r; 
          yCor=c;
        }
      }
    }
    col = #FFE834;
    size = 25;
    speed = 5;
  }

  public void move() {
    if (direction == 'u') yCor-= speed; //change everything in this class to gets and sets? ex. getDirection()=='u'
    if (direction == 'd') yCor+= speed;
    if (direction == 'l') xCor-= speed;
    if (direction == 'r') xCor+= speed;
  }
}

