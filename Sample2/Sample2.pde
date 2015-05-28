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
  makeField();
  //printing the following out to see what the array looks like
  for (Object[] o : field){
    println(Arrays.toString(o));
  }
}  

//public void makeStage() {
//  stroke(255); 
//  rectMode(CENTER); 
//  rect(width/2, height/2, 400, 1);
//  //NOT WORKING :(
//  for (int r = width/2-400/2; r<width/2+400/2;r++){
//    field[r][height/2]=wall;
//  }
//}

public void makeField(){
  String[] strArray = {
                      "ppwpppppp",
                      "ppwpppppp",
                      "ppppppppp",
                      "ppwpppppp",
                      "ppwpppppp"
                      };
  for (int r = 0; r<strArray.length;r++){
    for (int c = 0; c<strArray[r].length();c++){
      field[r][c] = strArray[r].charAt(c);
    }
  }
}
