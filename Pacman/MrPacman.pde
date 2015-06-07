public class MrPacman extends Organism {

  public MrPacman() {
    xCor = width/2+25; //starting position may be edited later
    yCor = height/2+25; //TODO: replace 25 (a magic number) with a var instead
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

