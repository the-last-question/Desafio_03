// bounce code for pong ball
float cont = 0.05;
int rad = 10;        // Width of the shape
float xpos, ypos;    // Starting position of shape    

float xspeed = 6.2 + cont;  // Speed of the shape
float yspeed = 2.2 + cont;  // Speed of the shape

int xdirection = 1;  // Left or Right
int ydirection = 1;  // Top to Bottom


void movementSetup() 
{ 
  frameRate(60);
  ellipseMode(RADIUS);
  // Set the starting position of the shape
  xpos = width/2;
  ypos = height/2;
}




void movementDraw() 
{
  cont = cont + 0.00005;
  
  xspeed = 3.0 + cont;  // Speed of the shape
  yspeed = 1.0 + cont; 
  
  // Update the position of the shape
  
  xpos = xpos + ( xspeed * xdirection );
  ypos = ypos + ( yspeed * ydirection );
  
  // Test to see if the shape exceeds the boundaries of the screen
  // If it does, reverse its direction by multiplying by -1
  if (xpos > width-rad || xpos < rad) {
    xdirection *= -1;
    //delay(500);
    //movementSetup();
  }
  if (ypos > height-rad-30 || ypos < rad+30) {
    ydirection *= -1;
    //delay(500);
    //movementSetup();
    
  }

  // Draw the shape
  ellipse(xpos, ypos, rad, rad);
}
