import java.io.*;
import java.util.*;
import javax.swing.*;

public class DoubleLL<T> {

  public class DLLNode<T> extends Node<T> {
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

  private int count = 0;
  public DLLNode<T> current;

  public void insert(T d) {
    DLLNode<T> n = new DLLNode<T>(d);
    if (current==null) {
      current = n;
    } else {
      n.setNext(current);
      current.setPrev(n);
      current = n;
    }
    count++;
  }

  public void DLLremove() {
    if (current.getNext() == null) {
      current = current.getPrev();
      current.setNext(null);
    } else if (current.getPrev() == null) {
      current = current.getNext();
      current.setPrev(null);
    } else {
      DLLNode<T> x = current.getPrev();
      x.setNext(current.getNext());
      current = x;
    }
    count--;
  }

  public int getCount() {
    return count;
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
  void drawDLL() {
    int n = this.getCount();
    float theta = radians(360.0/n);
    if (n == 1) {
      current.setNodeXY(width/2, height/2);
      current.setNodeColor(color(52, 172, 175));
      current.drawNode();
    } else {
      translate(width/2, height/2);
      DLLNode<T> node = getFirst();
      addNodes(node, theta);
    }
  }
  DLLNode<T> getFirst() {
    DLLNode<T> node = current;
    while (node.getPrev () != null) {
      node = node.getPrev();
    }
    return node;
  }
  void addNodes(DLLNode<T> node, float theta) {
    pushMatrix(); // Save the current state of transformation (i.e. where are we now)
    rotate(theta); //rotate by angle
    if (node == current) {
      current.setNodeColor(color(52, 172, 175));
    } else {
      node.setNodeColor(0);
    }
    if (count<11) {
      node.setNodeXY(0, (count*20));
    } else {
      node.setNodeXY(0, 200);
    }
    node.drawNode();
    addBranch(node, theta);
    if (node.getNext() != null) {
      addNodes(node.getNext(), theta);
    }
    popMatrix();
  }
  void addBranch(DLLNode<T> node, float theta) {
    if (count == 2) {
      pushMatrix();
      translate(0, 0);
      rotate(PI);
      line(0, 0, 0, 30);
      fill(255);
      strokeWeight(4);
      popMatrix();
    }
    if (node.getNext() != null) {
      pushMatrix();
      if (count<11) {
        translate(0, (count*20));
      } else {
        translate(0, 200);
      }
      float r = (PI-theta)/2;
      rotate(PI-r);
      float len;
      if (count<11) {
        len = ((count*20)*sin(theta))/r;
      } else {
        len = (200*sin(theta))/r;
      }
      line(0, 10, 0, len+13);
      fill(255);
      strokeWeight(4);
      popMatrix();
    }
  }
}

