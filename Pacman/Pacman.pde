import java.util.*;
import java.io.*;

private Object[][] field;
private char path = 'p';
private char wall = 'w';


public void setup() {
  background(0);
  size(10, 10);
  field = new Object[width][height];
//  for (int r = 0; r<field.length; r++) {
//    for (int c = 0; c<field[0].length;c++){
//      field[r][c] = path; 
//    }
//  }
  //printing the following out to see what the array looks like
  for (Object[] o : field){
    println(Arrays.toString(o));
  }
}  

