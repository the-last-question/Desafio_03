import processing.serial.*;


Serial myPort;

float pot1;
float pot2;
int bot;


String strpack = "";
char[] comms;

int pointer = 0;

String paddleL = "", paddleR = "";

void serialSetup(){
  String portName = Serial.list()[0];
  myPort = new Serial(this, portName, 9600); 
  
}

void serial(){
if (myPort.available() > 0) {
    strpack = myPort.readStringUntil('\n');

    if (strpack != null) {
      paddleL = "";
      paddleR = "";
      comms = strpack.toCharArray();

      for (int i = 0; i < strpack.length(); i++) {
        if (comms[i] == '/') {
          pointer++;
          i++;
        }

        if (pointer == 0) paddleL += comms[i];
        if (pointer == 1) paddleR += comms[i];
      }
      
      pot1 = map(float(paddleL) ,0,1023, 0, height);
      pot2 = map(float(paddleR) ,0,1023, 0, height);      
      
      println(pot1);
      println(pot2);
      pointer = 0;
    }

  }  
}
