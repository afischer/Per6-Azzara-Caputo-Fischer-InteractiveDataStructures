float theta;   
int numNodes;
PFont font;  

void setup() {
  size(640, 360);
  font = loadFont("../../../assets/ArialMT-16.vlw");
  textFont(font);
  textAlign(CENTER);

}

void draw() {
  background(0); //Color!

  int firstData = 1; //eventually need this to draw from a BST


  frameRate(30);
  stroke(255);

  // Let's pick an angle 0 to 90 degrees based on the mouse position
  float a = (mouseX / (float) width) * 90f;
  //Convert it to radians
  theta = radians(a);
  // Start the tree from the bottom of the screen
  translate(width/2,-20);
  //rotate it to the top
  rotate(PI);

  // put the first node's data at the end
  rotate(PI);
  text(""+firstData,0,75); 
  rotate(PI);
  fill(255);
  // Move to the end of that line
  translate(0,-80);
  // Start the recursive branching!
  branch(80);

}

void branch(float h) {
  int currentData = 2; //eventually need this to draw from a BST
  // Each branch will be 2/3rds the size of the previous one
  h *= 0.66;
  
  // All recursive functions must have an exit condition!!!!
  // Here, ours is when the length of the branch is 6 pixels or less
  if (h > 6) {
    pushMatrix();    // Save the current state of transformation (i.e. where are we now)
    rotate(theta);   // Rotate by theta
    line(0, 0, 0, -h);  // Draw the branch
    text(""+currentData,0,-h-5); //put in the current data on right
    translate(0, -h-20); // Move to the end of the branch
    branch(h);       // Ok, now call branch to draw two new branches!!
    popMatrix();     // Whenever we get back here, we "pop" in order to restore the previous matrix state
    
    // Repeat the same thing, only branch off to the "left" this time!
    pushMatrix();
    rotate(-theta);
    line(0, 0, 0, -h);
    text(""+currentData,0,-h-5); //put in the current data
    translate(0, -h-20);
    branch(h);
    popMatrix();
  }
}

void keyPressed() {
  int keyIndex = -1;
  if (key >= '0' && key <= '9') {
    //Insert the number
  } 
  if (keyIndex == -1) {
    // If it's not a letter key remove
  } else { 
    //Do nothing...
  }
}
