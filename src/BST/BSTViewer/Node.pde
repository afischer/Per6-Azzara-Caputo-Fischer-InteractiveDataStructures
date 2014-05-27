public class Node{
  private int data, NColor, xcor, ycor;
  public void drawNode(){
    ellipse(xcor, ycor, 50, 50);
    fill(NColor);
  }
  
  public Node(int data){
    this.data = data;
  }
  public String toString() {return ""+data;}
  public void setData(int d) {data = d;}
  public int getData() {return data;}
  public void setNodeXY(int x, int y){
    xcor = x;
    ycor = y;
  }
  public void setNodeColor(int c){NColor = c;}
  
    
}
    
