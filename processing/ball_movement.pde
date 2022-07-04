// bounce code for pong ball
float cont = 1;
int rad = 20;        // Width of the shape
float xpos, ypos;    // Starting position of shape    

float xspeed = 3.0 + cont;  // Speed of the shape
float yspeed = 1.0 + cont;  // Speed of the shape

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
  cont = cont + 0.0005;  
  
  xspeed = 3.0 + cont;  // Speed of the shape
  yspeed = 1.0 + cont; 
  
  // Update the position of the shape 
  
  xpos = xpos + ( xspeed * xdirection );
  ypos = ypos + ( yspeed * ydirection );
  
  // Test to see if the shape exceeds the boundaries of the screen and the paddle 
  // If it does, reverse its direction by multiplying by -1 or place the ball in the middle and increase the score
  
  if (xpos < 68 && (ypos < mouseY+200 && ypos > mouseY) || xpos > width-68 && (ypos < mouseY+200 && ypos > mouseY)) {
    xdirection *= -1;   
  } else if (xpos > width) {
    scoreLeft = scoreLeft + 1;    
    xpos = width/2;
    ypos = height/2;
    delay(500);
    xdirection *= -1;
    cont = 1;
  }
  if (xpos < 0) {
    scoreRight = scoreRight + 1;
    xpos = width/2;
    ypos = height/2;
    delay(500);
    xdirection *= -1;
    cont = 1;
  }
  if (ypos > height-rad-30 || ypos < rad+30) {
    ydirection *= -1;
   
  }
  
  // Draw the shape
  fill(#FFFFFF);
  stroke(#FFFFFF);
  ellipse(xpos, ypos, rad, rad);
}
