import java.io.*;
import java.util.*;
import javax.swing.*;

PFont font;  
DoubleLL<Integer> DLL = new DoubleLL();

void setup() {
  size(700, 500);
  font = loadFont("../../assets/ArialMT-16.vlw");
  textFont(font);
  textAlign(CENTER);
  runDoubleLL();
}

void draw() {
  background(0); //Color!
  frameRate(30);
  stroke(255);
  drawDoubleLL();
}

void drawDoubleLL() {
  DLL.drawDoubleLL();
}

boolean firstTime = true;

void runDoubleLL() {
  int op1;
  Object[] options = {      
    "Model Double Linked List", "Input your own values"
  };
  int n = JOptionPane.showOptionDialog(null, "Would you like to use a model double linked list or put in your own values?", 
  "Double Linked List", JOptionPane.YES_NO_OPTION, JOptionPane.QUESTION_MESSAGE, 
  null, options, options[0]); //default button title
  if (n==0) { //model nodes :D
    int[] nodes = {
      7, 4, 5, 6, 2, 3, 1, 9, 8, 10, 11, 33
    };
    firstTime = false;
    for (int i = 1; i<nodes.length; i++) {
      DLL.insert(nodes[i]);
    }
  } else if (n==1) { // put in da values yo self!
    String preset="Node Value";
    String op1s;
    op1s = JOptionPane.showInputDialog(frame, "What number would you like the node to be?", preset);
    if (op1s != null) {
      op1=Integer.parseInt(op1s);
    }
    if (firstTime == true) {
      for (int i = 0; i < 2; i++) {
        op1s = JOptionPane.showInputDialog(frame, "Add node #" + i+1, preset);
        if (op1s != null) {
          op1=Integer.parseInt(op1s);
        }
        DLL.insert(Integer.parseInt(op1s));
        firstTime = false;
      }
    }
  }
}

