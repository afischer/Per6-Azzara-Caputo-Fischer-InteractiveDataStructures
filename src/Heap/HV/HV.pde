import java.io.*;
import java.util.*;
import javax.swing.*;

PFont font;  
Heap heap = new Heap();

void setup() {
  size(1300, 700);
  font = createFont("Arial",60,true);
  textFont(font);
  textAlign(CENTER);
  background(178,34,34);
  frameRate(10);
  text("Click to start!", 650, 400);
}

void draw(){
  
}

void mouseClicked(){
  Object[] options = {"Insert a random value", "Insert your own value"};
  int n = JOptionPane.showOptionDialog(null, "Would you like to insert a random value or put in your own values?", 
    "Heap", JOptionPane.YES_NO_OPTION, JOptionPane.QUESTION_MESSAGE, 
    null, options, options[0]);
  if (n==0) {
    background(178,34,34);
    int r = int(random(99)) + 1;
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


void exit(){
  super.exit();
}
