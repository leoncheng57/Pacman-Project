public class MrPacman extends Character {

  float xCor;
  float yCor;
  color col;
  char direction;

  public MrPacman() {
    xCor = width/2; //starting position may be edited later
    yCor = height/2;
    col = #FFE834;
  }

  void drawMe() {
    fill(col);
    ellipse(xCor, yCor, 25, 25);
  }

  void move() {
    if (direction == 'u') yCor--;
    if (direction == 'd') yCor++;
    if (direction == 'l') xCor--;
    if (direction == 'r') xCor++;
  }

  public void setDirection(char c) {
    direction = c;
  }
}

