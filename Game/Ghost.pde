public class Ghost extends Organism {

  boolean scared;
  color oldColor;
  private int[][] stageCopy;
  int timebefore;
  int spawnTime;
  int scaredDuration;
  float spawnPointX;
  float spawnPointY;
  boolean edible;

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
    scared=false;
    setDirection('l');
    timebefore=0;
    spawnTime=0;
    scaredDuration = 8000;
    edible=false;
  }

  public void randomDirection() {
    Random rnd = new Random();
    int num = rnd.nextInt(4);
    if (num == 0) setNextDirection('d');
    else if (num == 1) setNextDirection('u');
    else if (num == 2) setNextDirection('l');
    else if (num == 3) setNextDirection('r');
  }  

  //actions that happen to ghost when Pacman gets a powerup.
  public void badtimes() {
    if (timebefore==0) {
      timebefore=millis();
      oldColor = col;
      this.setColor(#1C5CFA); //blue, color of scared ghosts
      this.setEdible(true);
    }
    if (abs(this.getX()-pac.getX())<25 && abs(this.getY()-pac.getY())<25 && this.isEdible()) {
      println("im eaten");
      this.setAlive(false);
      this.setReady(false);
      score+=50;
      this.setEdible(false);
      return;
    }

    //println(millis()-timebefore);
    if (millis()-timebefore > scaredDuration) {
      this.setColor(oldColor);
      this.setScared(false);
      timebefore=0;
    }
  }

  public void setScared(boolean e) {
    scared=e;
  }

  public boolean isScared() {
    return scared;
  }

  public void respawn() {
    this.setColor(oldColor);
    this.setX(spawnPointX);
    this.setY(spawnPointY);
    if (spawnTime==0) {
      spawnTime=millis(); //WHat is spawntiem? to keep them in the base for like 5 secs before they go back out and start moving.  bascially ready variable allows themt o move alive is for drawing  ill brb
      this.setColor(oldColor);
      this.setAlive(true);
    }
    //println(millis()-spawnTime);
    if (millis()-spawnTime > 4000) {
      //println("this happens");
      this.setReady(true); 
      spawnTime=0;
    }
  }

  public void killPac() {
    if (!this.isEdible() && abs(this.getX()-pac.getX())<25 && abs(this.getY()-pac.getY())<25) {
      pac.setAlive(false);
    }
  }

  public void setEdible(boolean e) {
    edible=e;
  }

  public boolean isEdible() {
    return edible;
  }
}

