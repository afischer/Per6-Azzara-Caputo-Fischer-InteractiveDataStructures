import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.io.*; 
import java.util.*; 
import javax.swing.*; 
import java.io.*; 
import java.util.*; 
import javax.swing.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class DLL extends PApplet {





PFont font;  
DoubleLL<Integer> DLL = new DoubleLL();

public void setup() {
  size(700, 500);
  font = loadFont("../../assets/ArialMT-16.vlw");
  textFont(font);
  textAlign(CENTER);
  runDoubleLL();
}

public void draw() {
  background(0); //Color!
  frameRate(30);
  stroke(255);
  drawDoubleLL();
}

public void keyReleased() { //if they want to enter a new node
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

public void drawDoubleLL() {
  DLL.drawDLL();
}

boolean firstTime = true;

public void runDoubleLL() {
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

  public void insert(T d, boolean left) {
    DLLNode<T> n = new DLLNode<T>(d);
    if (current==null) {
      current = n;
    }else if(left){
      if (current.getPrev() == null){
        current.setPrev(n);
        n.setNext(current);
        current = current.getPrev();
      }else{
        DLLNode<T> x = current.getPrev();
        x.setNext(n);
        n.setPrev(x);
        n.setNext(current);
        current.setPrev(n);
        current = n;
      }
    }else{
      if (current.getNext() == null){
        current.setNext(n);
        n.setPrev(current);
        current = current.getNext();
      }else{
        DLLNode<T> x = current.getNext();
        x.setPrev(n);
        n.setNext(x);
        n.setPrev(current);
        current.setNext(n);
        current = n;
      }
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
  public void drawDLL() {
    int n = this.getCount();
    float theta = radians(360.0f/n);
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
  public DLLNode<T> getFirst() {
    DLLNode<T> node = current;
    while (node.getPrev () != null) {
      node = node.getPrev();
    }
    return node;
  }
  public void addNodes(DLLNode<T> node, float theta) {
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
  public void addBranch(DLLNode<T> node, float theta) {
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

public class Node<E>{
  private E data; 
  private float xcor, ycor;
  private int NColor;
  public void drawNode(){
    ellipse(xcor, ycor, 30, 30);
    fill(NColor);
    text(""+data, xcor, ycor+5);
    fill(255);
  }
  
  public Node(E data){
    this.data = data;
  }
  public String toString() {return ""+data;}
  public void setData(E d) {data = d;}
  public E getData() {return data;}
  public void setNodeXY(float x, float y){
    xcor = x;
    ycor = y;
  }
  public float getX(){return xcor;}
  public float getY(){return ycor;}
  public void setNodeColor(int c){NColor = c;}
  
}
    
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "DLL" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
