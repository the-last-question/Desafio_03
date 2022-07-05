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
  frameRate(70);
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
  
  // teste de colisões com bordas do jogo e barras 
  //se houver colisão com as barras inverte a vx
  // se houver colisão com as bordas coloca a bola no meio e aumenta a pontuação do player
  
  if (xpos < 68 && (ypos < pot1 +200 && ypos > pot1) || xpos > width-68 && (ypos < pot2+200 && ypos > pot2)) {
    xdirection *= -1;   
  } else if (xpos > width) { // ponto pro lado esquerdo
    scoreLeft = scoreLeft + 1;    
    xpos = width/2;
    ypos = height/2;
    delay(500);
    xdirection *= -1;
    cont = 1;
  }
  if (xpos < 0) { //ponto pro lado direito
    scoreRight = scoreRight + 1;
    xpos = width/2;
    ypos = height/2;
    delay(500);
    xdirection *= -1;
    cont = 1;
  }
  if (ypos > height-rad-30 || ypos < rad+30) { // bola bate no teto ou no chão
    ydirection *= -1;
    //delay(500);
    //movementSetup();    
  }
  
  //desenhando a bola
  fill(#FFFFFF);
  stroke(#FFFFFF);
  ellipse(xpos, ypos, rad, rad);
}
