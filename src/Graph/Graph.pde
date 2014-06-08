import java.io.*;
import java.util.*;
import javax.swing.*;

int bs = 25; //node size
boolean bover = false;
Node over;
boolean locked = false;

Node cNode;

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
    println("Closest node is " + closest);
  }
}


Node closest;


void closestNode() {
  float xcor, ycor;
  float smallestDist=9999; //THIS COULD BE THE PROBLEM

  if (!locked) { //IF YOU ARE DRAGGING A NODE, STOP CHECKING FOR NEW CLOSER NODES
    for (Node current : nodes) {
      xcor=current.getbx();
      ycor=current.getby();    
      //print(current);

      if (current.nodeDist()<smallestDist) {
        closest = current;
        smallestDist = current.nodeDist();
      }
    }
    println("Closest node is " + closest);
    cNode = closest;
  }
}

void mousePressed() {
  if (bover) { 
    locked = true; 
    fill(255, 255, 255);
  } else {
    locked = false;
  }
  bdifx = mouseX-cNode.getbx(); //object.setx to mouse x
  bdify = mouseY-cNode.getby();
}

void mouseDragged() {
  if (locked) {
    println("Currently dragging node: " + cNode);
    cNode.setbx(mouseX); 
    cNode.setby(mouseY);
  }
}

void mouseReleased() {
  locked = false;
}

