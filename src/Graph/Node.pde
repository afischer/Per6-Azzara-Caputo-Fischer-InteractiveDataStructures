public class Node {
  private int data, count;
  public float bx; //make random later
  public float by; //make random later

  public Node() {
    this.data = data;
    this.count = 1;
  }

  public Node(int x, int y) {
    bx = x;
    by = y;
    this.count = 1;
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


void mousePressed() {
  if (bover) { 
    locked = true; 
    fill(255, 255, 255);
  } else {
    locked = false;
  }
  bdifx = mouseX-bx; //object.setx to mouse x
  bdify = mouseY-by;
}


void mouseDragged() {
  if (locked) {
    Node.bx = mouseX-bdifx; 
    by = mouseY-bdify;
  }
}



void mouseReleased() {
  locked = false;
}



