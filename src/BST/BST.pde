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
  frameRate(30);
  stroke(255);
  drawTree(); 
  boolean inAdder = false;

  if (keyPressed && !inAdder) { //if they want to enter a new node
    inAdder = true;
    System.out.println("in adder status: " + inAdder);
    if (key == ' ') { //if they press SPACEBAR
      String op1s;
      int op1;
      String preset="Node Value";
      op1s = JOptionPane.showInputDialog(frame, "Add a node", preset); //make a frame asking to add node
      try {
        if (op1s != null) { //if they put something in
          op1=Integer.parseInt(op1s);
          inAdder = false;
          System.out.println("in adder status: " + inAdder);
        }

        BST.insert(Integer.parseInt(op1s));
        System.out.println("added to tree.");
        inAdder = false;
        System.out.println("in adder status: " + inAdder);

      }
      catch (Exception NumberFormatException) {
        System.out.println("Dumb user don't know what a number is.");
        System.out.println("in adder status: " + inAdder);
      }
      

      pushMatrix();
      popMatrix();
      inAdder = false; 
      System.out.println("in adder status: " + inAdder);

    }
    
  }
}

void drawTree() {
  BST.drawTree(BST.root);
}



/////////// TREE CODE! //////////

public class Tree {
  private class TreeNode extends Node {
    TreeNode left, right;
    public TreeNode(int d) {
      super(d);
      left = null;
      right = null;
    }
    public void setLeft(TreeNode l) {
      left = l;
    }
    public void setRight(TreeNode r) {
      right = r;
    }
    public TreeNode getLeft() {
      return left;
    }
    public TreeNode getRight() {
      return right;
    }
  }

  private TreeNode root;

  boolean firstTime = true;


  public Tree() {
    int op1;
    Object[] options = {      
      "Model Tree", "Input your own values"
    };
    int n = JOptionPane.showOptionDialog(null, "Would you like to use a model tree or put in your own values?", 
    "Binary Search Tree", JOptionPane.YES_NO_OPTION, JOptionPane.QUESTION_MESSAGE, 
    null, options, options[0]); //default button title
    if (n==0) { //model tree nodes :D
      int[] nodes = {
        7, 4, 5, 6, 2, 3, 1, 9, 8, 10, 11, 33
      };
      firstTime = false;
      root = new TreeNode(nodes[0]);
      root.setNodeColor(color(52, 172, 175));
      for (int i = 1; i<nodes.length; i++) {
        insert(nodes[i]);
      }
    } else if (n==1) { // put in da values yo self!
      String preset="Node Value";
      String op1s;
      op1s = JOptionPane.showInputDialog(frame, "What number would you like the root to be?", preset);
      if (op1s != null) {
        op1=Integer.parseInt(op1s);
      }
      if (firstTime == true) {
        root = new TreeNode(Integer.parseInt(op1s));
        root.setNodeColor(color(52, 172, 175));
        for (int i = 0; i < 2; i++) {
          op1s = JOptionPane.showInputDialog(frame, "Add node #" + i++, preset);
          if (op1s != null) {
            op1=Integer.parseInt(op1s);
          }
          insert(Integer.parseInt(op1s));
          firstTime = false;
        }
      }
    }
  }

  public boolean insert(int d) {
    firstTime = false;
    TreeNode x = new TreeNode(d);
    if (root == null) { //If we got no root, make one
      root = x;
      return true;
    }
    boolean inPlace = false; //our stop condition
    TreeNode current = root; //moving through the tree like a sloth on roids
    while (!inPlace) {
      int i = current.getData();
      if (d<i) { //
        if (current.getLeft()==null) {
          current.setLeft(x);
          inPlace = true;
        } else {
          current = current.getLeft();
        }
      } else if (d>i) {
        if (current.getRight()==null) {
          current.setRight(x);
          inPlace = true;
        } else {
          current = current.getRight();
        }
      } else { //If they are equal
        current.incrementCount();
        return true;
      }
    }
    return inPlace;
  }


  public TreeNode find(int target) {
    TreeNode current = root;               
    while (current.getData () != target)        
    {
      if (target < current.getData()) {         
        current = current.getLeft();
      } else {                          
        current = current.getRight();
      }
      if (current == null) {            
        return null;
      }
    }
    return current;
  }


  void drawTree(TreeNode r) {
    float theta = PI/6;
    if (r.equals(BST.root)) {
      // Start the tree from the bottom of the screen
      translate(width/2, 40);
      //rotate it to the top
      rotate(PI);
      // put the first node's data at the end
      rotate(PI);
      BST.root.setNodeXY(0, 75);
      BST.root.drawNode();
      rotate(PI);
      fill(255);
      // Move to the end of that line
      translate(0, -80);
    }

    float h = 50;
    if (r.getRight() != null) {
      addBranch(r.getRight(), -theta, h);
    }

    // Repeat the same thing, only branch off to the left this time!
    if (r.getLeft() != null) {
      addBranch(r.getLeft(), theta, h);
    }
  }

  void addBranch(TreeNode r, float x, float h) {
    pushMatrix(); // Save the current state of transformation (i.e. where are we now)
    rotate(x); //rotate by angle
    //    rotate(45);
    line(0, 0, 0, -h); // Draw the branch
    strokeWeight(3);
    r.setNodeXY(0, -h-5); //put in the current data
    r.setNodeColor(color(0, 0, 0));
    r.drawNode();
    translate(0, -h-20); // Move to the end of the branch
    drawTree(r);
    popMatrix();
  }
}

