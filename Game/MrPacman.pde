public class MrPacman extends Organism {

  private int lives;
  private int timebefore;
  
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
    lives = 3;
  }

  public void loseLife() {
    lives--; 
    textSize(32);
    text("You lost a life!", width-200, height-20);
    if (timebefore==0) {
      timebefore=millis();
    }
    if (millis()-timebefore > 1000) {
      textSize(20);
      text("You lost a life!", width-200, height-20);
    }
    if (millis()-timebefore > 2000) {
      textSize(10);
      text("You lost a life!", width-200, height-20);
    }
    //TODO: find a way to notify that a life has been lost, maybe using animations
  }

  public int getLives() {
    return lives;
  }
}

