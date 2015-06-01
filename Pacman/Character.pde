public class Character {

  float xCor;
  float yCor;
  float wid = 40;
  float hgt = 40;

  public Character(){ 
  }

  public Character(float x, float y) {
    xCor = x;
    yCor = y;
    ellipse(x, y, wid, hgt); 
  }
  
}
