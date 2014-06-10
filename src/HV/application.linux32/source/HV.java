import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.io.*; 
import java.util.*; 
import javax.swing.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class HV extends PApplet {





PFont font;  
Heap heap = new Heap();

public void setup() {
  size(1300, 700);
  font = createFont("Arial",60,true);
  textFont(font);
  textAlign(CENTER);
  background(0);
  frameRate(10);
  text("Click to start!", 650, 400);
}

public void draw(){
  
}

public void mouseClicked(){
  Object[] options = {"Insert a random value", "Insert your own value"};
  int n = JOptionPane.showOptionDialog(null, "Would you like to insert a random value or put in your own values?", 
    "Heap", JOptionPane.YES_NO_OPTION, JOptionPane.QUESTION_MESSAGE, 
    null, options, options[0]);
  if (n==0) {
    background(0);
    int r = PApplet.parseInt(random(99)) + 1;
    heap.add(r);
    heap.drawIt();
    textSize(20);
    text("Click to add a new node.", 650, 75);
    textSize(30);
    text("HEAP/MAXIMUM INTEGER PRIORITY QUEUE VISUALIZER", 650, 45);
  } else if (n==1) {
    int v;
    String preset="Node Value";
    String op1s;
    op1s = JOptionPane.showInputDialog(frame, "What number would you like to add?", preset);
    if (op1s != null) {
      try{
        v=Integer.parseInt(op1s);
        background(178,34,34);
        heap.add(v);
        heap.drawIt();
        textSize(20);
        text("Click to add a new node.", 650, 75);
        textSize(30);
        text("HEAP/MAXIMUM INTEGER PRIORITY QUEUE VISUALIZER", 650, 45);
      }catch(NumberFormatException e){
        textSize(30);
        text("You did not input an integer. Click to try again.", 650, 675);
      }
        
    }
  }
  
}


public void exit(){
  super.exit();
}

class Heap{
  int[]h = new int[10];
  
  public Heap(){  
   h[0] = 0; 
  }

  public int getSize(){ return h[0]; }
    
  public int getMax(){ return h[1]; }

  public void drawNode(int xcor, int ycor, int data){
    ellipse(xcor, ycor, 25, 25);
    fill(color(0));
    textSize(15);
    text(data, xcor + 1, ycor+6);
    fill(255);
  }
  
  public void drawIt(){
    drawBranch(1, 650, 100, 325);
    
  }
  
  public void drawBranch(int hindex, int xcor, int ycor, int levelbase){
    try{
      int q = h[hindex];
      stroke(255);
      drawNode(xcor,ycor,q);
      drawBranch(hindex*2, xcor - levelbase, ycor + 50, levelbase/2, xcor, ycor);
      drawBranch(hindex*2+1, xcor + levelbase, ycor + 50, levelbase/2, xcor, ycor);
    }catch(IndexOutOfBoundsException e){
    }
  }
  
  public void drawBranch(int hindex, int xcor, int ycor, int levelbase, int parentx, int parenty){
    try{
      int q = h[hindex];
      if (q != 0){
        strokeWeight(4);
        stroke(255);
        line (parentx,parenty,xcor, ycor);
        line (parentx,parenty,xcor, ycor);      
        strokeWeight(1);
        drawNode(parentx,parenty,h[hindex/2]);
        //draw self @ xcor ycor
        drawNode(xcor,ycor,q);     
        //left
        drawBranch(hindex*2, xcor - levelbase, ycor + 50, levelbase/2, xcor, ycor);
        //right
        drawBranch(hindex*2+1, xcor + levelbase, ycor + 50, levelbase/2, xcor, ycor);
      }
    }catch(IndexOutOfBoundsException e){
    }
  }

  public void resize(){
    if (h[0]+5 > h.length){
      int[] newList = new int[h.length + 5];
      for (int i = 0; i < h[0] + 1; i++){
       newList[i] = h[i];
      }
      h = newList;
    }
  }
  
  public void add(int value){
    h[0]++;
    h[h[0]] = value;
    pushUp(h[0]);
    resize();
  }
    
  public void pushUp(int index){
    if (index < 2){
      //do nothing
    }else if (index == 2){
      if (h[2] > h[1]){
        int temp = h[2];
        h[2] = h[1];
        h[1] = temp;
      }
    }else if (h[index] > h[index/2]){
      int temp = h[index];
      h[index] = h[index/2];
      h[index/2] = temp;
      pushUp(index/2);
    }
  }
  
  public String toString(){
    String f = "heap: [";
    for (int i = 0; i < h[0]; i++){
      f+= h[i] + ", ";
    }
    f+= h[h[0]]+"]";
    return f;
  }
}

  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "HV" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
