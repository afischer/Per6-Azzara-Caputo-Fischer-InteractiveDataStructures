import java.io.*;
import java.util.*;
import javax.swing.*;

PFont font;  
Tree BST = new Tree();

void setup() {
  size(700, 500);
  font = loadFont("../../assets/ArialMT-16.vlw");
  textFont(font);
  textAlign(CENTER);
}


void draw() {
  background(0); //Color!
  text("Binary Search Tree", width/2, 20);
  text("Press SPACE to add a node", width/2, height-20);
  frameRate(30);
  stroke(255);
  drawTree(); 
}

void keyReleased() { //if they want to enter a new node
  if (key == ' ') { //if they press SPACEBAR
    String op1s;
    int op1;
    String preset="Node Value";
    op1s = JOptionPane.showInputDialog(frame, "Add a node", preset); //make a frame asking to add node
    try {
      if (op1s != null) { //if they put something in
        op1=Integer.parseInt(op1s);
      }

      BST.insert(Integer.parseInt(op1s));
      System.out.println("added to tree.");
    }
    catch (Exception NumberFormatException) {
      System.out.println("Dumb user don't know what a number is.");
    }
    pushMatrix();
    popMatrix();
  }
}

void drawTree() {
  BST.drawTree(BST.root,1);
}




