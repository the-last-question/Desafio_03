// projeto PONG 


int cont1 = 0;   //contador do mousePressed(); pra iniciar o jogo caso seja maior que 0
int cont2 = 0;   //contador para iniciar settings


void setup(){
 
//definir tamanho e cor da tela
 foto = loadImage("/home/rod/Computer-Vision-IEE-RAS-desafio/desafio_VC_RAS/images/penguin.jpeg");
 fullScreen(); 
 movementSetup();
 serialSetup();
}


void draw(){
//comecando o jogo

  if(mousePressed == false){
    telaInicial();
  } else if(mousePressed == true &&  (mouseY >= height-700 && mouseY <= height-600) ){
    cont1 ++;// começa o jogo
  } else if(mousePressed == true &&  (mouseY >= height-500) && (mouseY <= height-400  ) ){
     cont2++; // entra em settings
  }
  
  if(cont1 > 0){ //jogo
    serial();
    tela();
    pecaE();
    pecaD();
    movementDraw();
    placar();
              
  }
  
  
  if(cont2 > 0){ //settings
    setting();    
  }
   
}
