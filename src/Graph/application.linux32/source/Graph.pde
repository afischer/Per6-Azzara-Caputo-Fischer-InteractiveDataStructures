//REMAKE BASED ON PROCESSINGJS.COM HEADER ANIMATION UNDER THE MIT License - F1lT3R/Hyper-Metrix

int count = 1; //num nodes
int Size = 15; //node size
float[][] e = new float[count][5]; // Build float array to store properties of nodes
float[][] old = new float[count][5]; //keep old values
float ds=2; // Set size of dot in circle center
boolean dragging=false; // Set drag switch to false
boolean adding=false;
float minDist = 100;
boolean needHelp = true;
PFont font;  
boolean groupDrag = false;
float startX, startY;

// integers showing which circle (the first index in e) that's locked, and its position in relation to the mouse
int lockedCircle; 
int lockedOffsetX;
int lockedOffsetY;
float lockedOffsetXgroup, lockedOffsetYgroup;

// If user presses mouse...
void mousePressed () {
  startX = mouseX;
  startY = mouseY;
  // Look for a circle the mouse is in, then lock that circle to the mouse
  // Loop through all circles to find which one is locked
  for (int j=0; j< count; j++) {
    // If the circles are close...
    if (sq(e[j][0] - mouseX) + sq(e[j][1] - mouseY) < sq(e[j][2]/2)) {
      // Store data showing that this circle is locked, and where in relation to the cursor it was
      lockedCircle = j;
      lockedOffsetX = mouseX - (int)e[j][0];
      lockedOffsetY = mouseY - (int)e[j][1];
      lockedOffsetXgroup = (int)e[j][0] - startX;
      lockedOffsetYgroup = (int)e[j][1] - startY;
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
  if (key == '=' || key == '+') { //if they press +(or=) increase mindist
    minDist+=5;
  }
  if (key == '?' || key == '/') { //if they press ?(or/) toggle help
    needHelp = !needHelp;
  }
  /*if (key == 'g') {//if they press g, toggle groupMove.
   groupDrag = !groupDrag;
   }*/
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
  font = loadFont("../../assets/ArialMT-16.vlw");
  textFont(font);
  textAlign(LEFT);
}

void drawHelp() {
  fill(999, 999, 999, 999);
  text("HELPFUL HELP MENU OF HELPING", width/2-230, height/2+150);
  text("?    Show/Hide Help", width/2-230, height/2+200-15);
  text("n    New Node", width/2-230, height/2+200);
  text("-     Decrease node linking distance - Currently " + minDist + " units.", width/2-230, height/2+215);
  text("h    Increase node linking distance", width/2-230, height/2+230);
  // text("g    Toggle GroupDrag [" + groupDrag + "]", width/2-230, height/2+245);
}

void draw() {
  background(0);
  if (needHelp) {
    drawHelp();
  }
  for (int j=0; j< count; j++) {
    noStroke(); //no stroke if over 
    // Cache diameter and radius of current circle
    float radi=e[j][2];
    float diam=radi/2;
    if (sq(e[j][0] - mouseX) + sq(e[j][1] - mouseY) < sq(e[j][2]/2))
      fill(64, 200, 128, 100); // green if mouseover
    else
      fill(999, 999, 999, 999); // regular
    if ((lockedCircle == j && dragging /*&& !groupDrag*/)) {
      // Move the nodes's coordinates to the mouse's position, minus its original offset
      e[j][0]=mouseX-lockedOffsetX;
      e[j][1]=mouseY-lockedOffsetY;
    }
    /*if ((lockedCircle == j && dragging && groupDrag)) { //GROUP DRAGGING!
     
     // Loop through all circles
     for (int k=0; k< count; k++) {
     // If the circles are within minDist (with a little buffer room)
     if ( sq(e[j][0] - e[k][0]) + sq(e[j][1] - e[k][1]) < sq(minDist+3) ) {
     // move that circle too
     e[k][0]=mouseX-startX;
     e[k][1]=mouseY-lockedOffsetYgroup;
     }
     }
     }*/
    // Draw node
    ellipse(e[j][0], e[j][1], radi, radi);

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
      // If the circles are within minDist
      if ( sq(e[j][0] - e[k][0]) + sq(e[j][1] - e[k][1]) < sq(minDist) ) {
        // Stroke a line from current circle to adjacent circle
        line(e[j][0], e[j][1], e[k][0], e[k][1]);
      }
    }
    // Else turn off stroke/border
    noStroke();      
    // Draw dot in center of circle
    //rect(e[j][0]-ds, e[j][1]-ds, ds*2, ds*2);
  }
}

