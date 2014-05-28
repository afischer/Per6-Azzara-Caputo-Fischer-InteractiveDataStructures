public class Node{
  private int data; 
  private float xcor, ycor;
  private color NColor;
  public void drawNode(){
    ellipse(xcor, ycor, 30, 30);
    fill(NColor);
    text(data, xcor, ycor);
    fill(255);
  }
  
  public Node(int data){
    this.data = data;
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
    
