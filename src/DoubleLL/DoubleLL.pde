import java.io.*;
import java.util.*;
import javax.swing.*;

PFont font;  
DoubleLL<Integer> DLL = new DoubleLL<Integer>();

void setup() {
  size(700, 500);
  font = loadFont("../../../assets/ArialMT-16.vlw");
  textFont(font);
  textAlign(CENTER);
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

////////// DLL code /////////////


public class DoubleLL<E> {

  public class Node<E> {
    E data;
    Node<E> next, prev;
    public Node(E d) {
      this.data = d;
    }
    public String toString() { 
      return ""+data;
    }
    public void setData(E d) { 
      data = d;
    }
    public E getData() {
      return data;
    }
    public void setNext(Node<E> n) {
      next = n;
    }
    public Node<E> getNext() {
      return next;
    }
    public void setPrev(Node<E> p) {
      prev = p;
    }
    public Node<E> getPrev() {
      return prev;
    }
  }

  private Node<E> current;

  public void insert(E d) {
    Node<E> n = new Node<E>(d);
    if (current==null) {
      current = n;
    } else {
      n.setNext(current);
      current.setPrev(n);
      current = n;
    }
  }
void drawDoubleLL(){
  
}

  public E getCurrent() {
    return current.getData();
  }
  public void forward() {
    if (current.getNext() != null) {
      current = current.getNext();
    }
  }
  public void back() {
    if (current.getPrev() != null) {
      current = current.getPrev();
    }
  }

  public String toString() {
    if (current == null) {
      return "";
    }
    Node<E> tmp = current;
    while (current.getPrev () != null)
      tmp = tmp.getPrev();
    String s = "";
    while (tmp != null) {
      s = s + tmp.getData() + "";
      tmp = tmp.getNext();
    }
    return s;
  }
}


// old tree code to cannibalize

//
//  void drawTree(TreeNode r) {
//    float theta = PI/6;
//    if (r.equals(BST.root)) {
//      // Start the tree from the bottom of the screen
//      translate(width/2, 40);
//      //rotate it to the top
//      rotate(PI);
//      // put the first node's data at the end
//      rotate(PI);
//      BST.root.setNodeXY(0, 75);
//      BST.root.drawNode();
//      rotate(PI);
//      fill(255);
//      // Move to the end of that line
//      translate(0, -80);
//    }
//
//    float h = 50;
//    if (r.getRight() != null) {
//      addBranch(r.getRight(), -theta, h);
//    }
//
//    // Repeat the same thing, only branch off to the left this time!
//    if (r.getLeft() != null) {
//      addBranch(r.getLeft(), theta, h);
//    }
//  }
//
//  void addBranch(TreeNode r, float x, float h) {
//    pushMatrix(); // Save the current state of transformation (i.e. where are we now)
//    rotate(x); //rotate by angle
////    rotate(45);
//    line(0, 0, 0, -h); // Draw the branch
//    strokeWeight(4);
//    r.setNodeXY(0, -h-5); //put in the current data
//    r.setNodeColor(color(52, 172, 175));
//    r.drawNode();
//    translate(0, -h-20); // Move to the end of the branch
//    drawTree(r);
//    popMatrix();
//  }
//  
//   public Tree() {
//    int op1;
//    try { 
//      UIManager.setLookAndFeel(UIManager.getSystemLookAndFeelClassName());
//    } 
//    catch (Exception e) { 
//      e.printStackTrace();
//    }
//    Object[] options = {
//      "Model Tree", "Input your own values"
//    };
//    int n = JOptionPane.showOptionDialog(null, "Would you like to use a model tree or put in your own values?", 
//    "Binary Search Tree", JOptionPane.YES_NO_OPTION, JOptionPane.QUESTION_MESSAGE, 
//    null, options, options[0]); //default button title
//    if (n==0) { //model tree nodes :D
//      int[] nodes = {
//        7, 4, 5, 6, 2, 3, 1, 9, 8, 10, 11
//      };
//      root = new TreeNode(nodes[0]);
//      root.setNodeColor(color(52, 172, 175));
//      for (int i = 1; i<nodes.length; i++) {
//        insert(nodes[i]);
//      }
//    } else if (n==1) { // put in da values
//      String preset="Node Value";
//      String op1s;
//      op1s = JOptionPane.showInputDialog(frame, "What number would you like the root to be?", preset);
//      if (op1s != null) {
//        op1=Integer.parseInt(op1s);
//      }
//      root = new TreeNode(Integer.parseInt(op1s));
//      root.setNodeColor(color(52, 172, 175));
//      for (int i = 0; i < 10; i++) {
//        op1s = JOptionPane.showInputDialog(frame, "Add a node", preset);
//        if (op1s != null) {
//          op1=Integer.parseInt(op1s);
//        }
//        insert(Integer.parseInt(op1s));
//      }
//    }
//  }

