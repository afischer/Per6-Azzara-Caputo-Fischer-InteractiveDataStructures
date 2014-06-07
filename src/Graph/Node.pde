public class Node {
  private int data, count;
  protected float bx; //make random later
  protected float by; //make random later

  public Node() {
    this.data = data;
    this.count = 1;
    nodes.add(this);
    println("added" + this);
    //    current = null;
    //    closest = null;
  }

  public Node(int x, int y, int dat) {
    bx = x;
    by = y;
    this.count = 1;
    nodes.add(this);
    this.data = dat;
    println("added" + this);
    //    current = null;
    //    closest = null;
  }

  public float getbx() {
    return bx;
  }

  public float getby() {
    return by;
  }

  public void setbx(float x) {
    this.bx = x;
  }    

  public void setby(float y) {
    this.by = y;
  }    

  public float nodeDist() {
    double dist;
    dist = (Math.pow(abs(this.bx+mouseX), 2.0)-Math.pow(abs(this.by+mouseY), 2.0));
    float distance = (float)dist; 
    distance = sqrt(distance);
    return distance;
  }

  public void drawNode() {

    // Test if the cursor is over the box 
    if (mouseX > bx-bs && mouseX < bx+bs && 
      mouseY > by-bs && mouseY < by+bs) {
      bover = true;  
      if (!locked) { 
        stroke(255);
        fill(023, 123, 124);
      }
    } else {
      stroke(153);
      fill(003, 123, 124);
      bover = false;
    }
    // Draw the node;
    ellipse(bx, by, bs, bs);
  }

  public Node(int data) {
    this.data = data;
    this.count = 1;
  }

  public void incrementCount() {
    this.count++;
  }

  public String toString() {
    return ""+data;
  }
  public void setData(int d) {
    data = d;
  }
  public int getData() {
    return data;
  }
}

