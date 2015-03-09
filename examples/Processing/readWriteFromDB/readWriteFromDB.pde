import http.requests.*;

// Time Variables
int processingTime = 0;

// Data Server comunication variables
JSONObject response;
JSONObject lastData;
String lastValue;

// mouse pointers class (receive routine inside class)
PImage arrow;
PVector arrowPos;
PVector newArrowPos;
String mouseReceived;

// Data visualization
PFont f;

// client sending data
int sendWait = 40; // 25 FPS
int sendTime = 0;
int sendReset = millis();
boolean sendMouse = false;

// server receiving new data
int receiveWait = 40; // 25 FPS
int receiveTime = 0;
int receiveReset = millis();
boolean receiveMouse = false;


void setup(){
  size(800,600);
  
  arrowPos = new PVector(0,0);
  newArrowPos = new PVector(0,0);
  arrow = loadImage("cursor.png");
  
  f = loadFont("ArialMT-18.vlw");
  textFont(f, 22);
  
}

void updateUPStreaming(){
  
  ////////////////////////////////////////
  // sending timeline
  sendTime = processingTime-sendReset;
  if(sendTime > sendWait){
    sendMouse = true;
  }
  
  if(sendMouse){
    // send data to server
    sendData("n3m3da","mouse","text",str(mouseX)+"_"+str(mouseY));
    
    sendMouse = false;
    sendReset = millis();
  }
  ////////////////////////////////////////
  
}

void updateDOWNStreaming(){
  ////////////////////////////////////////
  // receiving timelines
  receiveTime = processingTime-receiveReset;
  if(receiveTime > receiveWait){
    receiveMouse = true;
  }
  
  if(receiveMouse){
    // receive data from server
    mouseReceived = receiveData("n3m3da","mouse");
    if(mouseReceived != ""){
      newArrowPos = extractMouseData(mouseReceived);
    }
    
    receiveMouse = false;
    receiveReset = millis();
  }
  ////////////////////////////////////////
}

void draw(){
  // main time
  processingTime = millis();
  
  // read the mouse position from database
  updateDOWNStreaming();
  
  background(255);
  textAlign(LEFT);
  fill(0);
  
  arrowPos.x = arrowPos.x*0.05 + newArrowPos.x*0.95;
  arrowPos.y = arrowPos.y*0.05 + newArrowPos.y*0.95;
  
  image(arrow,arrowPos.x,arrowPos.y);
}

void mouseMoved(){
  // write new position of mouse on the database only when mouse is moving
  updateUPStreaming();
}

void keyReleased(){
  // for send/receive data from DB testing purpose
  if(key == 'g'){
    mouseReceived = receiveData("n3m3da","mouse");
    
  }else if(key == 's'){
    sendData("n3m3da","mouse","text",str(mouseX)+"_"+str(mouseY));
  }
  
}
