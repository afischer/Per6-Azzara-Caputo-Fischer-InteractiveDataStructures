float radius = 15.0;
int X, Y;
int nX, nY;

void setup() {
  size(640, 360);
  frameRate( 30 );
  noSmooth();
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
  // Fill canvas grey
  
  //Need to make this drop the node.
  if (mousePressed) {
    stroke(255);
  } else {
    stroke(0);
  }
  
  pushMatrix();
  popMatrix();
}

// Set circle's next destination
void mouseMoved(){
  nX = mouseX;
  nY = mouseY;  
}
