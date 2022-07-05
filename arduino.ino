// C++ code
//
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

char point[10];
int pot1 = A0;
int pot2 = A1;
int bot = 5;
//int sense2 = 6;



void setup()
{
  pinMode(pot1, INPUT);
  pinMode(pot2, INPUT);
  pinMode(bot, INPUT);
  Serial.begin(9600);
}

void loop()
{
        
// creating variables for a short code
    int sens1; 
    int sens2; 
    int sens11; 
    // 
    int sens22; 
  
  sens1 = analogRead(pot1);
  itoa(sens1, point, 10);
  Serial.write(point);
  Serial.write("-");

  sens1 = analogRead(pot2);
  itoa(sens2, point, 10);
  Serial.write(point);
  Serial.write("-");

  sens1 = analogRead(bot);
  itoa(sens11, point, 10);
  Serial.write(point);
  Serial.write("-");

 // sens1 = analogRead(sense2);
 // itoa(sens22, point, 10);
 // Serial.write(point);
 // Serial.write("-");
 
 Serial.write('\n');
  delay(20);
}