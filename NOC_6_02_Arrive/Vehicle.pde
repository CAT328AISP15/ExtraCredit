// Seek_Arrive
// Daniel Shiffman <http://www.shiffman.net>

// The "Vehicle" class

class Vehicle 
{
  
  PVector location;
  PVector velocity;
  PVector acceleration;
  float r;
  float maxforce;    // Maximum steering force
  float maxspeed;    // Maximum speed

  Vehicle(float x, float y) {
    acceleration = new PVector(0,0);
    velocity = new PVector(0,0);
    location = new PVector(x,y);
    r = 6;
    maxspeed = 6;
    maxforce = 0.1;
  }

  // Method to update location
  void update() 
  {
    // Update velocity
    velocity.add(acceleration);
    // Limit speed
    velocity.limit(maxspeed);
    location.add(velocity);
    // Reset accelerationelertion to 0 each cycle
    acceleration.mult(0);
   }

  void applyForce(PVector force) {
    // We could add mass here if we want A = F / M
    acceleration.add(force);
  }

  // A method that calculates a steering force towards a target
  // STEER = DESIRED MINUS VELOCITY
  void arrive(PVector target) 
  {
    maxspeed = changeSpeed(target);
    PVector desired = PVector.sub(target,location);  // A vector pointing from the location to the target
    float d = desired.mag();
    // Normalize desired and scale with arbitrary damping within 100 pixels
    desired.normalize();
    if (d < 100) {
      float m = map(d,0,100,0,maxspeed);
      desired.mult(m);
    } else {
      desired.mult(maxspeed);
    }
    println(velocity);
    // Steering = Desired minus Velocity
    PVector steer = PVector.sub(desired,velocity);
    steer.limit(maxforce);  // Limit to maximum steering force
    applyForce(steer);
  }
  
  void display() {
    
    // Draw a triangle rotated in the direction of velocity
    float theta = velocity.heading2D() + PI/2;
    fill(127);
    stroke(0);
    strokeWeight(1);
    pushMatrix();
    translate(location.x,location.y);
    rotate(theta);
    beginShape();
    vertex(0, -r*2);
    vertex(-r, r*2);
    vertex(r, r*2);
    endShape(CLOSE);
    popMatrix();
    
    
  }
  //This class changes the speed of the persue agent from 6 to 4 at 400 units away and then from 4 to 2 at 200 
  //units away.
  
  float changeSpeed(PVector target)
  {
    if((target.x < location.x+400) && (target.x > location.x-400))
    {
      if((target.y < location.y+400) && (target.y > location.y-400))
      {
          if((target.x < location.x+200) && (target.x > location.x-200))
            {
              if((target.y < location.y+200) && (target.y > location.y-200))
               {
                maxspeed = 2;
               }
              else
                {
                maxspeed = 4; 
                }
            }
          else
            {
             maxspeed = 4; 
            }
      }
      else
       {
         maxspeed = 6; 
       }
    }
    else
      {
       maxspeed = 6; 
      }
    return maxspeed;
  }
 }

