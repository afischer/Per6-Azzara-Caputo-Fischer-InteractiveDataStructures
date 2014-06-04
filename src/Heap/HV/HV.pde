import java.io.*;
import java.util.*;
import javax.swing.*;

PFont font;  
Heap heap = new Heap();

void setup() {
  size(800, 800);
  font = createFont("Comic Sans MS",16,true);
  textFont(font);
  textAlign(CENTER);
  background(20,40,100);
  frameRate(30);
}

void draw(){
  
}

void mouseClicked(){
  heap.drawIt();
}


void exit(){
  super.exit();
}



/////HEAP CODE/////

class Heap{
  int[]h = {9,9,8,7,6,5,4,3,2,1};
  
  public Heap(){   
  }

  public int getSize(){ return h[0]; }
    
  public int getMax(){ return h[1]; }

  public void drawNode(int xcor, int ycor, int data){
    ellipse(xcor, ycor, 30, 30);
    fill(color(0));
    textSize(14);
    text(data, xcor, ycor+5);
    fill(255);
  }
  
  public void drawIt(){
    int xcor = 800 / 2;
    int ycor = 30;
    int level = 1;
    int upto = 1;
    while (upto < h.length){
      int temp = level;
      while (temp > 0){
        drawNode(xcor, ycor, h[upto]);
        xcor *= 3;
        ycor += 30;
        upto ++;
        temp --;
      }
      level *= 2;
    }
  }

  
  /*
  public void resize(){
    if (h[0] > h.length / 2){
      int[] newList = new int[(int)((double)h.length * 1.75)];
      for (int i = 0; i < h[0]; i++){
       newList[i] = h[i];
      }
      h = newList;
    }else if((h.length > 30) && (h[0] < h.length / 4)){
      int[] newList = new int[(int)((double)h.length * .75)];
      for (int i = 0; i < h[0]; i++){
        newList[i] = h[i];
      }
      h = newList;
    }
  }
  

  
  public void add(int value){
    int i = h[0];
    h[0]++;
    i++;
    h[i] = value;
    pushUp(i);
    resize();
  }
    
  public void pushUp(int index){
    if (index < 2){
      //do nothing
    }else if (index == 2){
      if (h[2] > h[1]){
        int temp = h[2];
        h[2] = h[1];
        h[1] = temp;
      }
    }else if (h[index] > h[index/2]){
      int temp = h[index];
      h[index] = h[index/2];
      h[index/2] = temp;
      pushUp(index/2);
    }
  }
    
    
  public int remove(){
    int f = h[1];
    if (h[2] > h[3]){
      h[1] = h[2];
      h[2] = Integer.MIN_VALUE;
      removeH(2);
    }else if (h[2] < h[3]){
      h[1] = h[3];
      h[3] = Integer.MIN_VALUE;
      removeH(3);
    }
    h[0]--;
    return f;
  }  
    
  public void removeH(int index){
    try{
      if (h[index*2] > h[index*2 + 1]){
        h[index] = h[index*2];
        h[index*2] = Integer.MIN_VALUE;
        removeH(index*2);
      }else if (h[index*2] < h[index*2 + 1]){
        h[index] = h[index*2 + 1];
        h[index*2] = Integer.MIN_VALUE;
        removeH(index*2 + 1);
      }
    }catch(ArrayIndexOutOfBoundsException E){
    }
  }
    */
 }

