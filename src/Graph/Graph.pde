import java.io.*;
import java.util.*;
import javax.swing.*;

int bs = 20;
boolean bover = false;
boolean locked = false;
float bdifx = 0.0; 
float bdify = 0.0; 

PFont font;  
Node n1, n2, n3, n4;
ArrayList<Node> nodes = new ArrayList<Node>();

void setup() 
{
  frameRate=60;
  size(700, 500);
  font = loadFont("../../assets/ArialMT-16.vlw");
  textFont(font);
  textAlign(CENTER);
  n1 = new Node(111, 111, 1);
  n2 = new Node(222, 222, 2);
  n3 = new Node(333, 333, 3);
  n4 = new Node(444, 444, 4);
}

void draw() {
  background(0);
  closestNode();
  for (int i=0; i!=nodes.size (); i++) {
    nodes.get(i).drawNode();
    //println("CHECKING " + i);
  }
}


Node closest;

float smallestx;
float smallesty;

Node closestNode() {
  float xcor, ycor;
  float smallestDist=9999;

  for (Node current : nodes) {
    xcor=current.getbx();
    ycor=current.getby();    
    print(current);

    if (current.nodeDist()<smallestDist) {
      closest = current;
      smallestx = xcor;
      smallesty = ycor;
      smallestDist = current.nodeDist();
    }
  }
  println("Closest node is " + closest);
  return closest;
}

void mousePressed() {
  if (bover) { 
    locked = true; 
    fill(255, 255, 255);
  } else {
    locked = false;
  }
  bdifx = mouseX-closestNode().getbx(); //object.setx to mouse x
  bdify = mouseY-closestNode().getby();
}

void mouseDragged() {
  if (locked) {
    println("Currently dragging node: " + closestNode());
    closestNode().setbx(mouseX-bdifx); 
    closestNode().setby(mouseY-bdify);
  }
}

void mouseReleased() {
  locked = false;
}

