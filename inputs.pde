//  input class

class Input {
String label;
int id;int x;int y;int w;int h;int Id;int Idr;
boolean active = false;
boolean isOver = false;

  Input(String labelB,int Id,int  xpos,int  ypos,int  widthB,int  heightB,boolean active,boolean over ) {
    label = labelB;
    x = xpos;
    y = ypos;
    w = widthB;
    h = heightB;
    id = Id;
    Idr = this.Id;
   this.active =active;
   this. isOver = over;
   
  }

  void display() {

   Idr =this.Id;
  
   fill(150);
   stroke(200,120,60);
  //  if(recive == true){ stroke(200,120,200);}
    strokeWeight(2);
   textSize(22);
   
   if(this.isOver == true){
     fill(0,0,150); stroke(200,120,60);
      rect(this.x, this.y, this.w, this.h, 5);}

    else  if(this.isOver == false){
          fill(0,0,100); stroke(200,180,60);
          rect(this.x, this.y, this.w, this.h, 5);}
      
//=======================================================          
          
   if(this.active == true){
     fill(0,0,150); stroke(200,180,60);
     rect(this.x, this.y, this.w, this.h, 5);
   }

//=======================================================
    textAlign(CENTER);
    fill(250,160,20);textSize(18);
   text(  this.label,this.x,this.y+(this.h+5));

   if(recive == true){
     fill(250,190,20); textSize(18);
     if(blink  && this.active == true){
   text("|"+ message[this.id],this.x,this.y+5);
     }else {
      text( message[this.id],this.x,this.y+5); 
     }
   fill(0,255,0); 
 } else if(recive == false){ text( " ",this.x,this.y+5);}


   // println(label.length());
  //  textAlign(CENTER, CENTER);
   // println(MouseIsOver());
   if(this.MouseIs() ){
      text(this.id,20,200);
    recive = true;run = 0;}
    // cursor(TEXT);
//  console.log(  Sinput.MouseIs()+ "  "+recive);
  }


  boolean  MouseIs() {
    if (mouseX > this.x-this.w && mouseX < this.x + this.w && mouseY > this.y-30 && mouseY < (this.y + 30)|| mIndex == this.id) {
      this.isOver = true;
      if(mousePressed){ this.active= true;}
    }else {this.isOver = false;}
    
  if (mouseX > this.x-this.w && mouseX < this.x + this.w && mouseY > this.y-30 && mouseY < (this.y + 30) || mIndex == this.id) {  
  if(mousePressed){
  
    
       recive = true;//println( "On"+ id);
  mIndex=id; return true;
      
    }
}else {this.active = false;}
    return false;

  }



}
