import java.io.*;
import java.util.*;
import javax.swing.*;

//float theta;   
PFont font;  
Tree BST = new Tree();

void setup() {
  size(700, 500);
  font = loadFont("../../../assets/ArialMT-16.vlw");
  textFont(font);
  textAlign(CENTER);
}

void draw() {
  background(0); //Color!
  //int firstData = BST.root.getData(); //eventually need this to draw from a BST

  frameRate(30);
  stroke(255);
  drawTree();
  
//  theta = PI/3;
//  // Let's pick an angle 0 to 90 degrees based on the mouse position
//  float a = (mouseX / (float) width) * 90f;
//  //Convert it to radians
//  theta = radians(a);
//  // Start the tree from the bottom of the screen
//  translate(width/2, 40);
//  //rotate it to the top
//  rotate(PI);
//
//  // put the first node's data at the end
//  rotate(PI);
//  BST.root.setNodeXY(0,75);
//  BST.root.drawNode();
//  rotate(PI);
//  fill(255);
//  // Move to the end of that line
//  translate(0, -80);
//  // Start the recursive branching!
//  branch(80);

}

void drawTree(){
  BST.drawTree(BST.root);
}
//
//void branch(float h) {
//  int currentData = 2; //eventually need this to draw from a BST
//  // Each branch will be 2/3rds the size of the previous one
//  h *= 0.66;
//
//  // All recursive functions must have an exit condition!!!!
//  // Here, ours is when the length of the branch is 6 pixels or less
//  if (h > 10) {
//    pushMatrix();    // Save the current state of transformation (i.e. where are we now)
//    rotate(theta);   // Rotate by theta
//    line(0, 0, 0, -h);  // Draw the branch
//    text(""+currentData, 0, -h-5); //put in the current data on right
//    translate(0, -h-20); // Move to the end of the branch
//    branch(h);       // Ok, now call branch to draw two new branches!!
//    popMatrix();     // Whenever we get back here, we "pop" in order to restore the previous matrix state
//
//    // Repeat the same thing, only branch off to the "left" this time!
//    pushMatrix();
//    rotate(-theta);
//    line(0, 0, 0, -h);
//    text(""+currentData, 0, -h-5); //put in the current data
//    translate(0, -h-20);
//    branch(h);
//    popMatrix();
//  }
//}

void keyPressed() {
  if (key >= '0' && key <= '9') {
    BST.insert(key);
    println("Added " + key + " to BST!");
  } else { 
    //Do nothing...
  }
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
    public void setLeft(TreeNode l) {left = l;}
    public void setRight(TreeNode r) {right = r;}
    public TreeNode getLeft() {return left;}
    public TreeNode getRight() {return right;}
  }
  private TreeNode root;

  public Tree() {
    int op1;
    try { 
      UIManager.setLookAndFeel(UIManager.getSystemLookAndFeelClassName());
    } 
    catch (Exception e) { 
      e.printStackTrace();
    } 
    String preset="Node Value";
    String op1s;
    op1s = JOptionPane.showInputDialog(frame, "What number would you like the root to be?", preset);
    if (op1s != null) {
      op1=Integer.parseInt(op1s);
    }
    root = new TreeNode(Integer.parseInt(op1s));
    root.setNodeColor(color(52, 172, 175));
    for (int i = 0; i < 10; i++){
    op1s = JOptionPane.showInputDialog(frame,"Add a node", preset);
    if (op1s != null) {
      op1=Integer.parseInt(op1s);
    }
    insert(Integer.parseInt(op1s));
    }
    
  }

  public boolean insert(int d) {
    TreeNode x = new TreeNode(d);
    if (root == null) {
      root = x;
      return true;
    }
    boolean inPlace = false;
    TreeNode current = root;
    while (!inPlace) {
      int i = current.getData();
      if (d<i) {
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
      } else {
        break;
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
  
  
void drawTree(TreeNode r){
  float theta = PI/4;
  if (r.equals(BST.root)){
    // Start the tree from the bottom of the screen
    translate(width/2, 40);
    //rotate it to the top
    rotate(PI);
    // put the first node's data at the end
    rotate(PI);
    BST.root.setNodeXY(0,75);
    BST.root.drawNode();
    rotate(PI);
    fill(255);
    // Move to the end of that line
    translate(0, -80);
  }
    
    float h = 50;
    if (r.getRight() != null) {
      addBranch(r.getRight(),-theta,h);
    }
    
    // Repeat the same thing, only branch off to the left this time!
    if (r.getLeft() != null) {
      addBranch(r.getLeft(),theta,h);
    }
}

void addBranch(TreeNode r, float x, float h){
    pushMatrix(); // Save the current state of transformation (i.e. where are we now)
    rotate(x); //rotate by angle
    line(0, 0, 0, -h); // Draw the branch
    strokeWeight(4);
    r.setNodeXY(0, -h-5); //put in the current data
    r.setNodeColor(color(52, 172, 175));
    r.drawNode();
    translate(0, -h-20); // Move to the end of the branch
    drawTree(r);
    popMatrix();
}
  
  public String toString(){
        return toString(root);
    }

  public String toString(TreeNode r){
  String result = "";
  if (r == null ||( r.getLeft()==null && r.getRight()==null)){
      return "";
  }
  else{
      result+=(r.getLeft()!=null ? r.getLeft().getData()+"<" : "")+r.getData()+(r.getRight()!=null ? ">"+r.getRight().getData() : "")+"\n";
      result+=toString(r.getLeft());
      result+=toString(r.getRight());
  }
  return result;
    }

}

