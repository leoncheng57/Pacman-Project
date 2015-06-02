public class Character {

  float xCor;
  float yCor;
  float wid = 40; //may have to change this to fatness
  float hgt = 40; //may have to chance this to tallness

  private Character(){  //should this be private or public?
  }

  public Character(float x, float y) {
    xCor = x;
    yCor = y;
    ellipse(x, y, wid, hgt); 
  }
  
}
