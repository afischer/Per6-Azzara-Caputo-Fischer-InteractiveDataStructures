import java.io.*;
import java.util.*;
import javax.swing.*;

PFont font;  
Heap heap = new Heap();

void setup() {
  size(1300, 700);
  font = createFont("Comic Sans MS",30,true);
  textFont(font);
  textAlign(CENTER);
  background(178,34,34);
  frameRate(10);
  text("Click to start!", 650, 400);
}

void draw(){
  
}

void mouseClicked(){
  background(178,34,34);
  int r = int(random(99)) + 1;
  println("adding: " + r );
  heap.add(r);
  heap.drawIt();
  println(heap.toString());
}


void exit(){
  super.exit();
}
