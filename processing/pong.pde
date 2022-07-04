// projeto PONG 


PFont pong;
PFont start;
PFont settings;
PImage foto;

int scoreLeft = 0;
int scoreRight = 0;

int cont1 = 0;   //contador do mousePressed(); pra iniciar o jogo caso seja maior que 0
int cont2 = 0;   //contador para iniciar settings

//fontes para settings

PFont colorSelector;
PFont red;
PFont lightBlue;
PFont black;

// contadores para mudar de cor a tela

int contDefault = 0;
int contRed = 0;
int contlightBlue = 0;
int contblack = 0;

//fonte para gameover
PFont gameover;
int contGameOver = 0;



//definir dimensoes do background e peças
void tela(){
  if(contDefault == 0){
    background(#254195);
    contRed = 0;
    contlightBlue = 0;
    contblack = 0;
  }
  if(contRed > 0){
    background(#FA6074);
    contlightBlue = 0;
    contblack = 0;
  }
  if(contlightBlue > 0){
    background(#60FAF9);
    contRed = 0;
    contblack = 0;    
  }
  if(contblack > 0){
    background(#000000);
    contRed = 0;
    contlightBlue = 0;    
  }
  
  stroke(#FFFFFF);
  strokeWeight(5);
  noFill();
    rect(10,10,width-20,height-50);
    
  stroke(#FFFFFF);
  strokeWeight(5);
  line(width/2,10,width/2,height-40);

}



void pecaE(){
 // mouseY sera a movimentação feita pelo potenciometro
  stroke(#FF2B24);
  fill(#FF2B24);
  rect(40,mouseY,8,200);
  
  
}



void pecaD(){
  stroke(#D7F51E);
  fill(#D7F51E);
  rect(width-50,mouseY,8,200);  
}



void telaInicial(){
      
      //image(foto,0,0);
      //foto.resize(width,height);
      
      background(#4A498B);
      
      pong = createFont("Te X Gyre Heros Regular", 16, true);     
      textFont(pong, 200);
      fill(#FFFFFF);  
      textAlign(CENTER);
      text("PONG", width/2, 300);
      
      start = createFont("Te X Gyre Heros Regular", 16, true);
      if( mouseY <= height-700 || mouseY >= height-600 ){
        textFont(start, 100);
        fill(#9D9DA7);
        textAlign(CENTER);
        text("start", width/2, height-600);
      } else {
        textFont(start, 100);
        fill(#FFFFFF);
        textAlign(CENTER);
        text("start", width/2, height-600);
      }
           
      settings = createFont("Te X Gyre Heros Regular", 16, true);
      if( (mouseY <= height-500) || (mouseY >= height-400  ) ){
        textFont(settings, 100);
        fill(#9D9DA7);
        textAlign(CENTER);
        text("settings", width/2, height-400);
      } else {
        textFont(settings, 100);
        fill(#FFFFFF);
        textAlign(CENTER);
        text("settings", width/2, height-400);
      }
}



void placar(){
  
    textSize(60);
    textAlign(CENTER);
    
    text(scoreRight, width/2+30, 60); // Right side score
    text(scoreLeft, width/2-30, 60); // Left side score
  
      if(scoreLeft > 1 || scoreRight > 1){
        clear();
        background(#000000);
        gameover = createFont("Te X Gyre Heros Regular", 16, true);     
        textFont(gameover, 200);
        fill(#FFFFFF);  
        textAlign(CENTER);
        text("GAME OVER", width/2, height/2);
          if(mousePressed == true && contGameOver == 0){
            delay(100);
            cont1 = 0;
            scoreLeft = 0;
            scoreRight = 0;
            contGameOver = 0;
            cont = 1; //zerar a velocidade da bola
            xpos = width/2; //colocar a bola na posição neutra
            ypos = height/2;
          }        
      }
}


void setting(){
  
  background(#4A498B);
  
  colorSelector = createFont("Te X Gyre Heros Regular", 16, true);
  textFont(colorSelector, 200);
  fill(#FFFFFF);
  textAlign(CENTER);
  text("Color Selector", width/2, 300);
  
    red = createFont("Te X Gyre Heros Regular", 16, true);
    textFont(red, 80);
    stroke(#FFFFFF);
    fill(#FA6074);
    textAlign(CENTER);
    text("Red", width/2, height/2);
    if(mousePressed == true &&  (mouseY >= (height/2)-40 && mouseY <= (height/2)+40) ){
       contRed ++; 
       contDefault ++;
       cont2 = 0;              
    }

  
       lightBlue = createFont("Te X Gyre Heros Regular", 16, true);
       textFont(lightBlue, 80);
       stroke(#FFFFFF);
       fill(#60FAF9);
       textAlign(CENTER);
       text("Light Blue", width/2, (height/2)+150);
       if(mousePressed == true &&  (mouseY >= ((height/2)+150)-40 && mouseY <= ((height/2)+150)+40 )){
          contlightBlue ++; 
          contDefault ++;
          cont2 = 0;          
      }
      
        black = createFont("Te X Gyre Heros Regular", 16, true);
        textFont(black, 80);
        stroke(#FFFFFF);
        fill(#000000);
        textAlign(CENTER);
        text("Black", width/2, (height/2)+300);
        if(mousePressed == true &&  (mouseY >= ((height/2)+300)-40 && mouseY <= ((height/2)+300)+40 )){
          contblack ++;   
          contDefault ++;
          cont2 = 0;
      }
}



void setup(){
 
//definir tamanho e cor da tela
 foto = loadImage("/home/rod/Computer-Vision-IEE-RAS-desafio/desafio_VC_RAS/images/penguin.jpeg");
 fullScreen(); 
 movementSetup();
}




void draw(){
    
  if(mousePressed == false){
    telaInicial();
  } else if(mousePressed == true &&  (mouseY >= height-700 && mouseY <= height-600) ){
    cont1 ++;
  } else if(mousePressed == true &&  (mouseY >= height-500) && (mouseY <= height-400  ) ){
     cont2++; 
  }
  
  if(cont1 > 0){
    tela();
    pecaE();
    pecaD();
    movementDraw();
    placar();
              
  }
  
  
  if(cont2 > 0){
    setting();    
  }
   
}
