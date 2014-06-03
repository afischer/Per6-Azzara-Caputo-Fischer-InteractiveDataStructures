public class Node {

  int x, y;
  int boxx, boxy;
  int stretchx;
  int stretchy;
  int size;
  boolean over;
  boolean press;
  boolean locked = false;
  boolean otherslocked = false;
  Node[] others;

  Node(int ix, int iy, int ilx, int ily, int is, Node[] o) {
    x = ix;
    y = iy;
    stretchx = ilx;
    stretchy = ily;
    size = is;
    boxx = x+stretchx - size/2;
    boxy = y+stretchy - size/2;
    others = o;
  }

  void update() {
    boxx = x+stretchx-size/2;
    boxy = y-size/2;

    for (int i=0; i<others.length; i++) {
      if (others[i].locked == true) {
        otherslocked = true;
        break;
      } else {
        otherslocked = false;
      }
    }

    if (otherslocked == false) {
      overEvent();
      pressEvent();
    }

    if (press) {
      stretchx = lock(mouseX-width/2-size/2, 0, width/2-size-1);
      stretchx = lock(mouseY-height/2-size/2, 0, height/2-size-1);
    }
  }


  void overEvent() {
    if (overNode(boxx, boxy, size, size)) {
      over = true;
    } else {
      over = false;
    }
  }

  void pressEvent() {
    if (over && mousePressed || locked) {
      press = true;
      locked = true;
    } else {
      press = false;
    }
  }

  void releaseEvent() {
    locked = false;
  }

  void display() {
    line(x, y, x+stretchx, y+stretchy);
    fill(255);
    stroke(0);
    ellipse(boxx, boxy, 15, 15);
    if (over || press) {
      line(boxx, boxy, boxx+size, boxy+size);
      line(boxx, boxy+size, boxx+size, boxy);
    }
  }
}

