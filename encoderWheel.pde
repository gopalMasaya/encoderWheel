 import processing.serial.*; 
Serial myPort;


PFont font;
PFont font1;
String message [] = new String [10];
boolean recive = false;
int run = 0;
int mIndex = 0;
int lastId = 0;
int count = 0;
int messagelength = 0;
int over= 0;
boolean blink = true;
String state = "2";
float data [] = new float [7];
String arr1[] = {"Hz:", "power:","Amp:","cell2 amp:","Lph:","total HHO:"};
int milli = 0;
float current = 0;
int av1 = 0;
int av2 = 0;
float amp1 = 0;
int cell_power = 0;
int minute;
int last_min = 0;
float amp = 0;
float watt = 0;
float efficiency = 0;
float Average_flow = 0;
float flowing = 0;



Button send;
Input Range;


PImage bg;
boolean calibrate = false;


int range = 30;
boolean dir = false;
boolean lastDir = false;
boolean error = false;
int reptition = 0;
float total_distance = 0;
int millis = 0;
float speed = 0;
float lastPos = 0;



void setup(){
  size(displayWidth,displayHeight);
//  fullScreen();
   pixelDensity(displayDensity());
  surface.setResizable(true);
  for(int i = 0; i< message.length;i++){
   message[i]=""; 
  }
  
   println(Serial.list());
   myPort = new Serial(this,"com4", 9600);
   myPort.bufferUntil('\n');
 
  
  send = new Button("on/off",20,280,100,40);
  Range = new Input("set distance",1,70,50,70,40,false,false);
 
 
  
  font =  createFont(PFont.list()[425], 32);
  font1 =  createFont(PFont.list()[366], 32);
  
 // cell1 = loadTable("cell1.csv","header");
 // cell2 = loadTable("cell2.csv","header");
  
 // bg =loadImage("image4.jpg");
}

void draw(){
 background(25);
 millis = millis();
 
 
 
 if(int(message[1])> 10){
   range = int(message[1]);
   
 // getting dirction
 if(data[0] < 0.3){dir = false;}
 if(data[0] > 30){dir = true;lastDir = dir;}
 
 //**************************************************************
 // calculations 
 
 // getting number of rounds
 if( lastDir != dir && dir == false){
   reptition +=1;
   lastDir = dir;
 }
 
 // calaulating speed
 if(lastPos != data[0]){
 total_distance = reptition * range *2;
 speed = abs( (millis/1000)* (data[0]-lastPos))/10*3.6;
 
 lastPos = data[0];
 }
 }
 
 //***********************************************************
 // outline of the display
 
 rectMode(CENTER);
 textAlign(LEFT);
 textSize(40);
 strokeWeight(1);
 fill(255,150,10);rect(width/2,height/2,range*15,60);
 fill(0,0,150);rect(width/2-(range*15/2)+15+(range*15/range *data[0]),height/2,30,50);
 fill(0,255,0);rect(width/2-(range*15/2),height/2,5,80);
 rect(width/2+(range*15/2)+30,height/2,5,80);
 
 
 
 
 //**********************************************************
 // desplaying to screen
 textSize(22);
 text("reps: "+ reptition,width*0.15,height-(height*0.35));
 text("distance: "+ int(data[0])+" cm",width*0.65,height-(height*0.35));
 text("total distance: "+ int(total_distance)+" cm",width*0.15,height-(height*0.6));
 text("speed: "+ int(speed)+" km/h",width*0.65,height-(height*0.6));
 
 //**********************************************************
 // showing user out of Range
 if(data[0] > 31 || data[0] < 0){
 error = true;
 
 textAlign(CENTER);
 text("out of Range", width/2,height/2-60);
 }else {error = false;}
 
 
 Range.display();
//**************  end of loop ******************************* 
}


void keyPressed(){
 if (keyCode == TAB) {
      mIndex ++;
    } else if (keyCode == UP && mIndex> 0) {
      mIndex--;
    } 
   // println(mIndex); 
 
}

void mousePressed(){
 
  if(send.MouseIsOver()){
 
} 

}


void keyTyped(){
 if( recive== true ){
  if(lastId != mIndex){count = 0;lastId= mIndex;run = 0;}
  // If the return key is pressed, save the String and clear it
  if (key == '\n' ) {  count = 0;recive = false;} else {
    // Otherwise, concatenate the String
    // Each character typed by the user is added to the end of the String variable.
    if(count < 60 && key != UP && key != DOWN && key != BACKSPACE){
       messagelength = message[mIndex].length();
     message[mIndex] =  message[mIndex] + key;
    count++;}
  }
if(key == BACKSPACE &&  message[mIndex].length() > 0){
 // println(mIndex);
      if( messagelength > 0){
       message[mIndex] =  message[mIndex].substring(0, message[mIndex].length()-1); }
      if(count > 0){ count-=1;}

     
} 
}
}


void serialEvent(Serial myPort) { 
 // get the ASCII string:
// println("data");
 String inString = myPort.readStringUntil('\n');
 
 if (inString != null) {
 // trim off any whitespace:
 inString = trim(inString);
 
 // split the string on the commas and convert the 
 // resulting substrings into an integer array:
 float[] inByte = float(split(inString, ","));
 println(inByte);
// println(inByte[1]);
 
 // if the array has at least three elements, you know
 // you got the whole thing.  Put the numbers in the
 // color variables:
 if (inByte.length >= 1) {
 // map them to the Range 0-255:
 data[0] = inByte[0]/10;
 data[1] = inByte[1];
 //data[2] = inByte[3];

 
   
 //println(data[6]+" "+state);
  
 }
 }
 }
