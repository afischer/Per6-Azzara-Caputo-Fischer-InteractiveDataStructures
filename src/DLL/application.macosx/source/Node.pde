public class Node<E>{
  private E data; 
  private float xcor, ycor;
  private color NColor;
  public void drawNode(){
    ellipse(xcor, ycor, 30, 30);
    fill(NColor);
    text(""+data, xcor, ycor+5);
    fill(255);
  }
  
  public Node(E data){
    this.data = data;
  }
  public String toString() {return ""+data;}
  public void setData(E d) {data = d;}
  public E getData() {return data;}
  public void setNodeXY(float x, float y){
    xcor = x;
    ycor = y;
  }
  public float getX(){return xcor;}
  public float getY(){return ycor;}
  public void setNodeColor(color c){NColor = c;}
  
}
    
