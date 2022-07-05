// C++ code
//
#include <stdio.h>
#include <stdlib.h>
#include <string.h>


int pot1 = A0, pot2 = A1; //Potenciometros
int vPot1 = 0, vPot2 = 0; //Valores dos potenciometros



void setup() {
  Serial.begin(9600);
  pinMode(pot1, INPUT);
  pinMode(pot2, INPUT);
  

}

void loop() {
  vPot1 = analogRead(pot1);
  Serial.print(String(vPot1) + "/"); //tranforma vpot1 e vpot2 em string
  
  vPot2 = analogRead(pot2);
  Serial.print(String(vPot2) + "/" + "\n");

  
  delay(50);
}