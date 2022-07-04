// projeto PONG 


PFont pong;
PFont start;
PFont settings;
PImage foto;

int scoreLeft = 0;
int scoreRight = 0;

int cont1 = 0;   //contador do mousePressed(); pra iniciar o jogo caso seja maior que 0


//definir dimensoes do background e peças
void tela(){
  background(#254195);
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
  stroke(#030202);
  fill(#030303);
  rect(width-50,mouseY,8,200);  
}



void telaInicial(){
      
      //image(foto,0,0);
      //foto.resize(width,height);
      
      background(#4A498B);
      
      pong = createFont("Courier10PitchBT-Bold-48", 16, true);     
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
  }
  
  if(cont1 > 0){
  
    tela();
    pecaE();
    pecaD();
    movementDraw();
    placar();
              
  }
   
}