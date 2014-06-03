float radius = 15.0;
int X, Y;
int nX, nY;
int xMin = 40; // the position of the canvas from left
int xMax = 260; // the position of the canvas from right

int yMin = 40; // the position of the canvas from top
int yMax = 260; // the position of the canvas from bottom


void setup() {
  size(640, 360);
  frameRate( 30 );
  smooth();
  fill(999);
  X = width / 2;
  Y = height / 2;
  nX = X;
  nY = Y;
}

void draw() {
  background( 123 );
  // Set fill-color to blue
  fill( 0, 121, 184 );
  // Draw circle at mouse
  ellipse( X, Y, radius, radius );  
  // Track circle to new destination
  X+=(nX-X);
  Y+=(nY-Y);  

  //Need to make this drop the node.
  if (mousePressed) {
    stroke(255);
  } else {
    stroke(0);
    strokeWeight(2);
    smooth();
    // Draw only if the mouse is inside the canvas and it is pressed
    if ((mouseX > xMin) && (mouseX < xMax)) { 
      if ((mouseY > yMin) && (mouseY < yMax)) {

        if (mousePressed) {
          line(pmouseX, pmouseY, mouseX, mouseY);
        }
      }
    }
    //pushMatrix();
    //popMatrix();
  }
}

  // Set circle's next destination
  void mouseMoved() {
    nX = mouseX;
    nY = mouseY;
  }

