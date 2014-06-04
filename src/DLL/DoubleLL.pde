import java.io.*;
import java.util.*;
import javax.swing.*;

public class DoubleLL<T>{

  public class DLLNode<T> extends Node<T>{
    T data;
    DLLNode<T> next, prev;
    public DLLNode(T d) {
      super(d);
    }
    public void setNext(DLLNode<T> n) {
      next = n;
    }
    public DLLNode<T> getNext() {
      return next;
    }
    public void setPrev(DLLNode<T> p) {
      prev = p;
    }
    public DLLNode<T> getPrev() {
      return prev;
    }
  }
 

  private DLLNode<T> current;

  public void insert(T d) {
    DLLNode<T> n = new DLLNode<T>(d);
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

  public T getCurrent() {
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
    DLLNode<T> tmp = current;
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

