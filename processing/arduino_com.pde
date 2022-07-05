import processing.serial.*;

Serial myPort;
int port;

float pot1;
float pot2;
int bot;
int h;

String pacote = "";
char[] pacoteAberto;

int seletor = 0;

String strBarra1 = "", strBarra2 = "";
String botao1 = "", botao2 = "";


void serialSetup(){
  String portName = Serial.list()[0];
  myPort = new Serial(this, portName, 9600); 
  
}

void serial(){
if (myPort.available() > 0) {
    pacote = myPort.readStringUntil('\n');

    if (pacote != null) {
      strBarra1 = "";
      strBarra2 = "";
      botao1 = "";
      botao2 = "";

      pacoteAberto = pacote.toCharArray();

      for (int i = 0; i < pacote.length(); i++) {
        if (pacoteAberto[i] == '-') {
          seletor++;
          //i++;
        }

        if (seletor == 0) strBarra1 += pacoteAberto[i];
        if (seletor == 1) strBarra2 += pacoteAberto[i];
        if (seletor == 2) botao1 += pacoteAberto[i];;
      }
      //println(strBarra1);
      //println(strBarra2);
      
      pot1 = map(float(strBarra1) ,0,1023, 0, height);
      pot2 = -(map(float(strBarra2) ,0,1023, 0, height));
      
      
      println(pot1);
      println(pot2);
      seletor = 0;
    }

  }  
}

























/*
  if(myPort.available() > 0){
    //myPort.clear();
    String inBuffer = myPort.readString(); 
    String aux0="", aux1="", aux2="", aux3="";
    int cont = 0;
    if (inBuffer != null) {
      println(inBuffer);
      for(int i =0; i< inBuffer.length(); i++){
        
        if((inBuffer.charAt(i) != '-') && cont == 0){
          aux0 += inBuffer.charAt(i);
          println(inBuffer.charAt(i));
          pot1 = Integer.parseInt(aux0);
          
        } else if((inBuffer.charAt(i) != '-') && cont == 1){
          aux1 += inBuffer.charAt(i);
          println(inBuffer.charAt(i));
          bot = Integer.parseInt(aux1);
          
        } else if((inBuffer.charAt(i) != '-') && cont == 2){
          aux2 += inBuffer.charAt(i);
          println(inBuffer.charAt(i));
          pot2 = Integer.parseInt(aux2);
          
        } else if((inBuffer.charAt(i) != '-') && cont == 3){
          aux3 += inBuffer.charAt(i);
          println(inBuffer.charAt(i));
          
        } else if(inBuffer.charAt(i) == '-'){
          cont +=1;
          println("");
        }
      }
      pot1 = Integer.parseInt(strBarra1);
      //bot = Integer.parseInt(aux1);
      //pot2 = Integer.parseInt(aux2);
    
      //pot1 = map(pot1 ,0,1020, 0, height);
      //pot2 = map(pot2 ,0,1020, 0, height);
      //cont = 0;

    }
    
   // println(pot1);
 }*/  
