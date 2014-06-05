import java.io.*;
import java.util.*;
import javax.swing.*;

int bs = 20;
boolean bover = false;
boolean locked = false;
float bdifx = 0.0; 
float bdify = 0.0; 

PFont font;  
Node n1;
Node n2;
ArrayList<Node> nodes = new ArrayList<Node>();

void setup() 
{
  frameRate=60;
  size(700, 500);
  font = loadFont("../../assets/ArialMT-16.vlw");
  textFont(font);
  textAlign(CENTER);
  n1 = new Node(333, 333);
  n2 = new Node(222, 222);
}

void draw() {
  background(0);
  for (int i=0; i!=nodes.size (); i++) {
    nodes.get(i).drawNode();
  }
}

Node closestNode() {
  float xcor, ycor;
  float smallestx=9999;
  float smallesty=9999;
  Node current = null;
  Node closest = null;
  for (int i=0; i!=nodes.size (); i++) {
    current=nodes.get(i);
    xcor=current.getbx();
    ycor=current.getby();
    println("Closest node is " + closest);
    println("Current node is " + current);

    if ((mouseX-xcor)<smallestx && (mouseY-ycor)<smallesty) {
      println((mouseX-xcor));
      println(mouseY-ycor);
      closest = current;
      smallestx = xcor;
      smallesty = ycor;
    }
  }
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
    closestNode().setbx(mouseX-bdifx); 
    closestNode().setby(mouseY-bdify);
  }
}

void mouseReleased() {
  locked = false;
}

