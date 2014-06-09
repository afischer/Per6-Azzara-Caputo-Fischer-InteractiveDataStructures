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

void keyReleased() { //if they want to enter a new node
  if (key == ' ') { //if they press SPACEBAR
    int op1;
    Object[] options = {      
      "Add Before", "Add After"
    };
    int n = JOptionPane.showOptionDialog(null, "Would you like to add the node before or after?", 
    "Add Node", JOptionPane.YES_NO_OPTION, JOptionPane.QUESTION_MESSAGE, 
    null, options, options[0]); //default button title
    if (n==0) { //add node to left
      String preset="Node Value";
      String op1s;
      op1s = JOptionPane.showInputDialog(frame, "What number would you like the node to be?", preset);
      try {
        if (op1s != null) { //if they put something in
          op1=Integer.parseInt(op1s);
        }
        DLL.insert(Integer.parseInt(op1s), true);
        System.out.println("added to double linked list.");
      }
      catch (Exception NumberFormatException) {
        System.out.println("Dumb user don't know what a number is.");
      }
    } else if (n==1) { // add node to right
      String preset="Node Value";
      String op1s;
      op1s = JOptionPane.showInputDialog(frame, "What number would you like the first node to be?", preset);
      try {
        if (op1s != null) { //if they put something in
          op1=Integer.parseInt(op1s);
        }
        DLL.insert(Integer.parseInt(op1s), false);
        System.out.println("added to double linked list.");
      }
      catch (Exception NumberFormatException) {
        System.out.println("Dumb user don't know what a number is.");
      }
    }
    pushMatrix();
    popMatrix();
  }
  if (key == 'r' ) {
    if (DLL.getCount()>1) {
      DLL.DLLremove();
    }
  }
  if (key == 'f') {
    if (DLL.current.getNext() != null) {
      DLL.forward();
      DLL.current.getPrev().setNodeColor(0);
    }
  }
  if (key == 'b') {
    if (DLL.current.getPrev() != null) {
      DLL.back();
      DLL.current.getNext().setNodeColor(0);
    }
  }
}

void drawDoubleLL() {
  DLL.drawDLL();
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
      1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11
    };
    firstTime = false;
    for (int i = 0; i<nodes.length; i++) {
      DLL.insert(nodes[i],true);
    }
  } else if (n==1) { // put in da values yo self!
    String preset="Node Value";
    String op1s;
    op1s = JOptionPane.showInputDialog(frame, "What number would you like the first node to be?", preset);
    if (op1s != null) {
      op1=Integer.parseInt(op1s);
    }
    DLL.insert(Integer.parseInt(op1s),true);
  }
}

