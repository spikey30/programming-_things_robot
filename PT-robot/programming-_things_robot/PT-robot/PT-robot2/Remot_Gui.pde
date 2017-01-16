// Processing application that demonstrates the Button class by creating a button
// Draws a square in the window when the mouse cursor is over the button
// Writes to the Processing IDE console pane when the button is clicked
// 3 July 2015    http://startingelectronics.org
Button auto;  // the button
Button stop;
Button left;
Button right;
Button backward;
Button forward;
Button room;
Button complete;

import processing.serial.*;

Serial myPort;      // The serial port
String whichKey = "";  // Variable to hold keystoke values
String stringIn = "";    // Incoming serial data

void setup() {
  size (500, 500);
 PFont myFont = createFont(PFont.list()[2], 14);
  textFont(myFont);
  smooth();
  String portName = "COM5";
  myPort = new Serial(this, portName, 9600);
  
  // create the button object
  auto = new Button("Auto", 20, 20, 100, 50);
  room = new Button("Room", 260, 20, 100,50);
  forward = new Button("^", 225, 140, 30, 50);
  backward = new Button("V", 225, 340, 30,50 );
  left = new Button("<", 140, 240, 30,50);
  //scan = new Button("Scan", 140, 240, 30,50);
  right = new Button(">", 300, 240, 30,50);
  stop  = new Button("Stop", 140, 20, 100,50 );
  complete = new Button("Complete", 380, 20, 100, 50);
}

void draw() {
  // draw the button in the window
  background(255);
  auto.Draw();
  stop.Draw();
  right.Draw();
  left.Draw();
  forward.Draw();
  backward.Draw();
  room.Draw();
  complete.Draw();
  text("Last Received: " + stringIn, 250, 100,CENTER);
  text("Last Sent: " + whichKey, 250,80, CENTER);
}
void serialEvent(Serial myPort) {
  stringIn = myPort.readStringUntil(10);
}

void keyPressed() {
  // Send the keystroke out:
  myPort.write(key);
  //whichKey = key;
}
// mouse button clicked
void mousePressed()
{
  if (auto.MouseIsOver()) {
    // print some text to the console pane if the button is clicked
    myPort.write('N');
    whichKey = "Auto Corridoor";
  }
  if(stop.MouseIsOver())
  {
    myPort.write('X');
    whichKey = "STOP";
    
  }
  if(room.MouseIsOver())
  {
    myPort.write('R');
    whichKey = "Outside room";
    
  }
  if(right.MouseIsOver())
  {
    myPort.write('D');
    whichKey = "Right";
    
  }
  if(left.MouseIsOver())
  {
    myPort.write('A');
    whichKey = "Left";
    
  }
  if(forward.MouseIsOver())
  {
    myPort.write('W');
    whichKey = "Forward";
    
  }
  if(backward.MouseIsOver())
  {
    myPort.write('S');
    whichKey = "Backward";
    
  }
  if(complete.MouseIsOver())
  {
    myPort.write('C');
    whichKey = "Complete";
    
  }
  
}

// the Button class
class Button {
  String label; // button label
  float x;      // top left corner x position
  float y;      // top left corner y position
  float w;      // width of button
  float h;      // height of button
  
  
  // constructor
  Button(String labelB, float xpos, float ypos, float widthB, float heightB) {
    label = labelB;
    x = xpos;
    y = ypos;
    w = widthB;
    h = heightB;
    
  }
  
  void Draw() {
    fill(218);
    stroke(141);
    rect(x, y, w, h, 10);
    textAlign(CENTER, CENTER);
    fill(0);
    text(label, x + (w / 2), y + (h / 2));
  }
  
  boolean MouseIsOver() {
    if (mouseX > x && mouseX < (x + w) && mouseY > y && mouseY < (y + h)) {
      return true;
    }
    return false;
  }
}