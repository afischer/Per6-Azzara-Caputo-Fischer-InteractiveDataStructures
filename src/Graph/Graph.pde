//REMAKE BASED ON PROCESSINGJS.COM HEADER ANIMATION UNDER THE MIT License - F1lT3R/Hyper-Metrix

int count = 1; //num nodes
int Size = 15; //node size
float[][] e = new float[count][5]; // Build float array to store properties of nodes
float[][] old = new float[count][5]; //keep old values
float ds=2; // Set size of dot in circle center
boolean dragging=false; // Set drag switch to false
boolean adding=false;
float minDist = 100;

// integers showing which circle (the first index in e) that's locked, and its position in relation to the mouse
int lockedCircle; 
int lockedOffsetX;
int lockedOffsetY;

// If user presses mouse...
void mousePressed () {
  // Look for a circle the mouse is in, then lock that circle to the mouse
  // Loop through all circles to find which one is locked
  for (int j=0; j< count; j++) {
    // If the circles are close...
    if (sq(e[j][0] - mouseX) + sq(e[j][1] - mouseY) < sq(e[j][2]/2)) {
      // Store data showing that this circle is locked, and where in relation to the cursor it was
      lockedCircle = j;
      lockedOffsetX = mouseX - (int)e[j][0];
      lockedOffsetY = mouseY - (int)e[j][1];
      // Break out of the loop because we found our circle
      dragging = true;
      break;
    }
  }
}
// If user releases mouse...
void mouseReleased() {
  // ..user is no-longer dragging
  dragging=false;
}

void keyPressed() {
  if (key == 'n') { //if they press n, add a new node
    //save locations
    adding = true;
    for (int i=0; i<e.length; i++) {
      for (int j=0; j<e[i].length; j++) {
        old[i][j]=e[i][j];
      }
    }
    count++;
    e = new float[count][5];
    setup();
  }
  
  if (key == '-') { //if they press -, decrease mindist
    minDist-=5;
  }
  if (key == '=' || key == '+') { //if they press -
    minDist+=5;
  }
}


// Set up canvas
void setup() {
  frameRate(60);
  size(500, 500);
  strokeWeight(1);
  for (int j=0; j< count; j++) {
    e[j][0]=random(width); // X 
    e[j][1]=random(height); // Y
    e[j][2]=(Size); // Radius
  }
  if (adding) {
    for (int i=0; i<old.length; i++) {
      for (int j=0; j<old[i].length; j++) {
        e[i][j]=old[i][j];
      }
    }
    old = new float[count][5];
    adding = false;
  }
}

void draw() {
  background(0);
  for (int j=0; j< count; j++) {
    noStroke(); //no stroke if over 
    // Cache diameter and radius of current circle
    float radi=e[j][2];
    float diam=radi/2;
    if (sq(e[j][0] - mouseX) + sq(e[j][1] - mouseY) < sq(e[j][2]/2))
      fill(64, 187, 128, 100); // green if mouseover
    else
      fill(64, 128, 187, 100); // regular
    if ((lockedCircle == j && dragging)) {
      // Move the particle's coordinates to the mouse's position, minus its original offset
      e[j][0]=mouseX-lockedOffsetX;
      e[j][1]=mouseY-lockedOffsetY;
    }
    // Draw circle
    ellipse(e[j][0], e[j][1], radi, radi);
    // Move circle
    //    e[j][0]+=e[j][3];
    //    e[j][1]+=e[j][4];


    /* Wrap edges of canvas so circles leave the top
     and re-enter the bottom, etc... */
    if ( e[j][0] < -diam      ) { 
      e[j][0] = width+diam;
    } 
    if ( e[j][0] > width+diam ) { 
      e[j][0] = -diam;
    }
    if ( e[j][1] < 0-diam     ) { 
      e[j][1] = height+diam;
    }
    if ( e[j][1] > height+diam) { 
      e[j][1] = -diam;
    }

    if ((lockedCircle == j && dragging)) {
      // Set fill color of center dot to white..
      fill(255, 255, 255, 255);
      // and set stroke color of line to green.
      stroke(128, 255, 0, 100);
    } else {            
      // otherwise set center dot color to black.. 
      fill(0, 0, 0, 255);
      // and set line color to turquoise.
      stroke(64, 128, 128, 255);
    }

    // Loop through all circles
    for (int k=0; k< count; k++) {
      // If the circles are close...
      if ( sq(e[j][0] - e[k][0]) + sq(e[j][1] - e[k][1]) < sq(minDist) ) {
        // Stroke a line from current circle to adjacent circle
        line(e[j][0], e[j][1], e[k][0], e[k][1]);
      }
    }
    // Turn off stroke/border
    noStroke();      
    // Draw dot in center of circle
    rect(e[j][0]-ds, e[j][1]-ds, ds*2, ds*2);
  }
}

