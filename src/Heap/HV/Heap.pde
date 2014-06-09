
class Heap{
  int[]h = new int[10];
  
  public Heap(){  
   h[0] = 0; 
  }

  public int getSize(){ return h[0]; }
    
  public int getMax(){ return h[1]; }

  public void drawNode(int xcor, int ycor, int data){
    ellipse(xcor, ycor, 15, 15);
    fill(color(0));
    textSize(13);
    text(data, xcor + 1, ycor+3);
    fill(255);
  }
  
  public void drawIt(){
    drawBranch(1, 650, 100, 325);
    
  }
  
  public void drawBranch(int hindex, int xcor, int ycor, int levelbase){
    try{
      int q = h[hindex];
      stroke(255);
      drawNode(xcor,ycor,q);
      drawBranch(hindex*2, xcor - levelbase, ycor + 50, levelbase/2, xcor, ycor);
      drawBranch(hindex*2+1, xcor + levelbase, ycor + 50, levelbase/2, xcor, ycor);
    }catch(IndexOutOfBoundsException e){
    }
  }
  
  public void drawBranch(int hindex, int xcor, int ycor, int levelbase, int parentx, int parenty){
    try{
      int q = h[hindex];
      if (q != 0){
        strokeWeight(4);
        stroke(255);
        line (parentx,parenty,xcor, ycor);
        line (parentx,parenty,xcor, ycor);      
        strokeWeight(1);
        drawNode(parentx,parenty,h[hindex/2]);
        //draw self @ xcor ycor
        drawNode(xcor,ycor,q);     
        //left
        drawBranch(hindex*2, xcor - levelbase, ycor + 50, levelbase/2, xcor, ycor);
        //right
        drawBranch(hindex*2+1, xcor + levelbase, ycor + 50, levelbase/2, xcor, ycor);
      }
    }catch(IndexOutOfBoundsException e){
    }
  }

  public void resize(){
    if (h[0]+5 > h.length){
      int[] newList = new int[h.length + 5];
      for (int i = 0; i < h[0] + 1; i++){
       newList[i] = h[i];
      }
      h = newList;
    }
  }
  
  public void add(int value){
    h[0]++;
    h[h[0]] = value;
    pushUp(h[0]);
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
  
  public String toString(){
    String f = "heap: [";
    for (int i = 0; i < h[0]; i++){
      f+= h[i] + ", ";
    }
    f+= h[h[0]]+"]";
    return f;
  }
}

