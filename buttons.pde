// button class

class Button {
  String label;
  float x;  float y; float w; float h;   
  
  // constructor
  Button(String labelB, float xpos, float ypos, float widthB, float heightB) {
    label = labelB;
    x = xpos; y = ypos; w = widthB; h = heightB;
  }
  
  // draw the button in the window
  void Draw() {
    if(MouseIsOver()){
    // rectMode(CORNERS); 
    fill(0,0,150,190);strokeWeight(2); stroke(250,190,16); 
    rect(x, y, w, h, 10);
    textAlign(CENTER);textSize(h/2);fill(250,190,20);
    noFill(); text(label, x + (w*0.03), y + (h / 6));
    } else{
     //  rectMode(CORNERS); 
       fill(0,0,150,190);strokeWeight(1); stroke(250,190,16); 
       rect(x, y, w, h, 10);
    textAlign(CENTER);textSize(h/2);fill(250,190,20);
    noFill(); text(label, x + (w *0.03), y + (h / 6));
      
      
    }
    
  }
  
  // returns true if the mouse cursor is over the button
  boolean MouseIsOver() {
    over = 0;
    if (mouseX > x-(w/2) && mouseX < (x + w/2) && mouseY > y-(h/2) && mouseY < (y + h/2)) {
      over = 1;
      return true;
    }
    return false;
   
  }
}
