#include <SoftwareSerial.h>
SoftwareSerial port(11,10); // RX, TX



#define encoder0PinA  2
#define encoder0PinB  3
volatile unsigned int lastPos = 0;
volatile unsigned int encoder0Pos = 0;
float dgree = 0;
float rounds = 0;
int r = 1;
float mm = 0;
float reduis = 35;
float resolution = 4096;


unsigned long timing;
unsigned long follower;



void setup() {
  pinMode(encoder0PinA, INPUT);
  pinMode(encoder0PinB, INPUT);
pinMode(12,OUTPUT);
pinMode(8,OUTPUT);
pinMode(4,INPUT_PULLUP);
pinMode(7,INPUT_PULLUP);
digitalWrite(8,LOW);
digitalWrite(12,HIGH);
  // encoder pin on interrupt 0 (pin 2)
  attachInterrupt(0, doEncoderA, CHANGE);

  // encoder pin on interrupt 1 (pin 3)
  attachInterrupt(1, doEncoderB, CHANGE);
  Serial.begin (9600);
  port.begin(9600);
  Serial.print("-HI-");  // Displays -HI- on all digits
 
 
  delay(500);
 
}

void loop() {
timing = millis();

//if(encoder0Pos > 500){encoder0Pos = 0;}
  
rounds = (encoder0Pos/resolution);
r = int(rounds);



float h = 2*PI* reduis;  
mm = h/resolution*encoder0Pos;

if(mm > 1000){mm = -1;}

if(lastPos != encoder0Pos){
 
  port.print(mm);
  port.print(",");
  port.println(rounds);
 
  lastPos = encoder0Pos;
 

}
}

void doEncoderA() {
  // look for a low-to-high on channel A
  if (digitalRead(encoder0PinA) == HIGH) {

    // check channel B to see which way encoder is turning
    if (digitalRead(encoder0PinB) == LOW) {
      encoder0Pos = encoder0Pos + 1;         // CW
     
    }
    else {
      encoder0Pos = encoder0Pos - 1;         // CCW
     
    }
  }

  else   // must be a high-to-low edge on channel A
  {
    // check channel B to see which way encoder is turning
    if (digitalRead(encoder0PinB) == HIGH) {
      encoder0Pos = encoder0Pos + 1;          // CW
    
    }
    else {
      encoder0Pos = encoder0Pos - 1;          // CCW
      
    }
  }
 
  // use for debugging - remember to comment out
}

void doEncoderB() {
  // look for a low-to-high on channel B
  if (digitalRead(encoder0PinB) == HIGH) {

    // check channel A to see which way encoder is turning
    if (digitalRead(encoder0PinA) == HIGH) {
      encoder0Pos = encoder0Pos + 1;         // CW
     
    }
    else {
      encoder0Pos = encoder0Pos - 1;         // CCW
     
    }
  }

  // Look for a high-to-low on channel B

  else {
    // check channel B to see which way encoder is turning
    if (digitalRead(encoder0PinA) == LOW) {
      encoder0Pos = encoder0Pos + 1;          // CW
     
    }
    else {
      encoder0Pos = encoder0Pos - 1;          // CCW
     
    }
  }
//   Serial.println (encoder0Pos, DEC);
//  Serial.println(dgree);
}
