
// A basic demo to random walk the AxidDraw plotter and show how to use CNCServer
//
// by Aaron Koblin
//



CNCServer cnc;
boolean readyToDraw = false;

void setup() {

  cnc = new CNCServer("http://localhost:4242");
  cnc.penUp();

  println("Plotter is at home? Press 'u' to unlock, 'z' to zero, 'd' to draw");
}

void draw(){
  
  if(readyToDraw){
    cnc.moveTo(random(50),random(50));
  }
}

void exit(){
  cnc.penUp();
  println("Goodbye!");
  super.exit();
}

void stop(){
 super.exit(); 
}

void keyPressed(){
  if(key == '[') cnc.penUp();
  if(key == ']') cnc.penDown();
  if(key == 'u'){
    cnc.unlock();
    println("Pen unlocked ..... remember to zero!");
  }
  if(key == 'z'){
    cnc.zero();
    println("Pen zero'd");
  }
  if(key == 'd'){
     cnc.penDown();
     readyToDraw = true;
     println("Drawing");
  }
}