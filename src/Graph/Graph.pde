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
void setup() 
{
  size(700, 500);
  font = loadFont("../../assets/ArialMT-16.vlw");
  textFont(font);
  textAlign(CENTER);
 
  //n2 = new Node(222,222);
  n1 = new Node(12,12);
  

}

void draw() {
  background(0);
  n1.drawNode();
  n2.drawNode();
}

