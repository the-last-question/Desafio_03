// C++ code
//


int pot1 = A0;
int pot2 = A1;

int pauseButton = 5;
int resetButton = 6;
bool pause;
bool pauseB;
bool reset;


void setup()
{
  pinMode(pot1, INPUT);
  pinMode(pot2, INPUT);
  
  pinMode(pauseButton, INPUT);
  pinMode(resetButton, INPUT);
  
   pause == LOW;
   pauseB == LOW;
   reset == LOW;
  
  Serial.begin(9600);
}

void loop()
{
  
 analogRead(pot1);
 analogRead(pot2);
  pause = digitalRead(pauseButton);
  reset = digitalRead(resetButton);
 

 Serial.print("valor potenciometro 1 :");
  Serial.println(analogRead(pot1));
  
 Serial.print("valor potenciometro 2 :");
  Serial.println(analogRead(pot2));
  
 Serial.println();
 
  while(pause == HIGH){
    if(pauseB == LOW){
      pauseB == HIGH;
    } else if(pauseB == HIGH){
      		pauseB == LOW;
    }
  }
  Serial.print("pause: ");
  Serial.println(pauseB);
  
  
  
  
  
  if(reset == LOW){
   	Serial.println("reset: OFF");
  } else {
   	 Serial.println("reset: ON");
  }
  Serial.println();
  
  delay(1000);
}


/* starting the serial comunnicate with the processing 

  void setup (){

    Serial.begin("9600") //this number is our baud, in case, is the frequency that we will use to put the arduino and processing in same languege

  }


  void loop(){

    Serial.println('Hello, my beatfull world!');
      delay (100);
  }




*/