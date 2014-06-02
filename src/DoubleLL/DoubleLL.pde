import java.io.*;
import java.util.*;
import javax.swing.*;

PFont font;  
DoubleLL<E> DLL = new DoubleLL();

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

  public class DLLNode<E> extends Node<E> {
    E data;
    DLLNode<E> next, prev;
    public DLLNode(E d) {
      super();
    }
    public void setNext(DLLNode<E> n) {
      next = n;
    }
    public DLLNode<E> getNext() {
      return next;
    }
    public void setPrev(DLLNode<E> p) {
      prev = p;
    }
    public DLLNode<E> getPrev() {
      return prev;
    }
  }

  public DoubleLL() {
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
      current = new DLLNode<E>(nodes[0]);
      current.setNodeColor(color(52, 172, 175));
      for (int i = 1; i<nodes.length; i++) {
        insert(nodes[i]);
      }
    } else if (n==1) { // put in da values yo self!
      String preset="Node Value";
      String op1s;
      op1s = JOptionPane.showInputDialog(frame, "What number would you like the node to be?", preset);
      if (op1s != null) {
        op1=Integer.parseInt(op1s);
      }
      if (firstTime == true) {
        current = new DLLNode<E>(Integer.parseInt(op1s));
        current.setNodeColor(color(52, 172, 175));
        for (int i = 0; i < 2; i++) {
          op1s = JOptionPane.showInputDialog(frame, "Add node #" + i+1, preset);
          if (op1s != null) {
            op1=Integer.parseInt(op1s);
          }
          insert(Integer.parseInt(op1s));
          firstTime = false;
        }
      }
    }
  }

  private DLLNode<E> current;

  public void insert(E d) {
    DLLNode<E> n = new DLLNode<E>(d);
    if (current==null) {
      current = n;
    } else {
      n.setNext(current);
      current.setPrev(n);
      current = n;
    }
  }
  
  void drawDoubleLL() {
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
    DLLNode<E> tmp = current;
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
//  void drawTree(TreeDLLNode r) {
//    float theta = PI/6;
//    if (r.equals(BST.root)) {
//      // Start the tree from the bottom of the screen
//      translate(width/2, 40);
//      //rotate it to the top
//      rotate(PI);
//      // put the first DLLNode's data at the end
//      rotate(PI);
//      BST.root.setDLLNodeXY(0, 75);
//      BST.root.drawDLLNode();
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
//  void addBranch(TreeDLLNode r, float x, float h) {
//    pushMatrix(); // Save the current state of transformation (i.e. where are we now)
//    rotate(x); //rotate by angle
////    rotate(45);
//    line(0, 0, 0, -h); // Draw the branch
//    strokeWeight(4);
//    r.setDLLNodeXY(0, -h-5); //put in the current data
//    r.setDLLNodeColor(color(52, 172, 175));
//    r.drawDLLNode();
//    translate(0, -h-20); // Move to the end of the branch
//    drawTree(r);
//    popMatrix();
//  }

