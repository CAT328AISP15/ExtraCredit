// Seek_Arrive
// Daniel Shiffman <http://www.shiffman.net>
// Nature of Code, Spring 2011

// Two "vehicles" follow the mouse position

// Implements Craig Reynold's autonomous steering behaviors
// One vehicle "seeks"
// One vehicle "arrives"
// See: http://www.red3d.com/cwr/

//Dylan Conley
//Extra credit

//This is the example from the book but i built the changeSpeed class
// to show an alternative way to slow down the ship as it gets closer
//with a more treadtional x and y cordinate collison detection.

//current steer forces are printed on the console below to better show
//the results.

Vehicle v;

void setup() {
  size(800, 200);
  v = new Vehicle(width/2, height/2);
  smooth();
}

void draw() {
  background(255);

  PVector mouse = new PVector(mouseX, mouseY);

  // Draw an ellipse at the mouse location
  fill(200);
  stroke(0);
  strokeWeight(2);
  ellipse(mouse.x, mouse.y, 48, 48);

  // Call the appropriate steering behaviors for our agents
  v.arrive(mouse);
  v.update();
  v.display();
}
