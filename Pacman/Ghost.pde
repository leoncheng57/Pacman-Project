public class Ghost extends Organism {

  boolean scared;
  color oldColor;
  private int[][] stageCopy;
  int timebefore;
  int spawnTime;
  int scaredDuration = 20000;
  float spawnPointX;
  float spawnPointY;
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
  }

  public void randomDirection() {
    Random rnd = new Random();
    int num = rnd.nextInt(4);
    if (num == 0) setNextDirection('d');
    else if (num == 1) setNextDirection('u');
    else if (num == 2) setNextDirection('l');
    else if (num == 3) setNextDirection('r');
  }  

  public void badtimes() {
    if (timebefore==0) {
      timebefore=millis();
      oldColor = col;
    }
    this.setColor(#1C5CFA); //blue, color of scared ghosts
    if (abs(this.getX()-pac.getX())==0 && abs(this.getY()-pac.getY())==0){
      println("im here");
      this.setAlive(false);
      this.setReady(false);
      
      //println(this.isAlive());
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
  public void respawn(){
    this.setX(spawnPointX);
    this.setY(spawnPointY);
    this.setColor(oldColor);
    this.drawMe();
    if (spawnTime==0){
      spawnTime=millis();
    }
    this.setColor(oldColor);
    this.setAlive(true);
    if (millis()-spawnTime > 2000){
     println("this happens");
     this.setReady(true); 
    }
      
    
  }
}

