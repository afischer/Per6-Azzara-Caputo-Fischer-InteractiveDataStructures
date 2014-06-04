public class Node{
  private int data; 
  private int count;
  private float xcor, ycor;
  private color NColor;
  
  public void drawNode(){
    ellipse(xcor, ycor, 30, 30);
    fill(NColor);
    textSize(14);
    text(data, xcor, ycor+5);
    textSize(9);
    text(count,xcor+7, ycor+13);
    textSize(14);
    fill(255);
  }
  
  public Node(int data){
    this.data = data;
    this.count = 1;
  }
  

  
  public void incrementCount(){
     this.count++; 
  }
  
  public String toString() {return ""+data;}
  public void setData(int d) {data = d;}
  public int getData() {return data;}
  public void setNodeXY(float x, float y){
    xcor = x;
    ycor = y;
  }
  
  public void setNodeColor(color c){NColor = c;}
    
}
