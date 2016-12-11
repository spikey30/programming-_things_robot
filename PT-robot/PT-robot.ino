#include <ZumoMotors.h>

ZumoMotors motors;

const int ledPin = 13; // the pin that the LED is attached to
int incomingByte;      // a variable to read incoming serial data into

void setup() {
  // initialize serial communication:
  Serial.begin(9600);
  // initialize the LED pin as an output:
  pinMode(ledPin, OUTPUT);
}

void loop() {
  // see if there's incoming serial data:
  if (Serial.available() > 0) {
    // read the oldest byte in the serial buffer:
    incomingByte = Serial.read();
    // if it's a capital H (ASCII 72), turn on the LED:
    if (incomingByte == 'W') {
      digitalWrite(ledPin, HIGH);
     
        motors.setLeftSpeed(300);
        motors.setRightSpeed(300);
      delay(1000);
        motors.setLeftSpeed(0);
        motors.setRightSpeed(0);
       
    }

    if(incomingByte == 'A')
    {
      digitalWrite(ledPin, HIGH);
      /*for (int speed = 0; speed <50; speed++)
      {

        motors.setLeftSpeed(speed);
        motors.setRightSpeed(speed+10);
        delay(2);
      }*/
     

        motors.setLeftSpeed(-150);
        motors.setRightSpeed(300);
        delay(500);
        motors.setLeftSpeed(0);
        motors.setRightSpeed(0);
      


      
    }
    if(incomingByte == 'D')
    {
      
      /*for (int speed = 0; speed <50; speed++)
      {

        motors.setLeftSpeed(speed);
        motors.setRightSpeed(speed+10);
        delay(2);
      }*/
     

        motors.setLeftSpeed(300);
        motors.setRightSpeed(-150);
        delay(500);
        motors.setLeftSpeed(0);
        motors.setRightSpeed(0);
      


      
    }
    // if it's an L (ASCII 76) turn off the LED:
    if (incomingByte == 'X') {
      digitalWrite(ledPin, LOW);
      int speed = 0;
        motors.setLeftSpeed(speed);
        
      
        motors.setRightSpeed(speed);
      
    }

    if(incomingByte == 'S')
    {
        
          motors.setRightSpeed(-300);
          motors.setLeftSpeed(-300);
          delay(1000);
        motors.setLeftSpeed(0);
        motors.setRightSpeed(0);




    }
    }
  }

