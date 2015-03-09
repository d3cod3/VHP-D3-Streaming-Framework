// Time Variables
int processingTime = 0;

// mouse pointers class (receive routine inside class)
PImage arrow;
PVector arrowPos;
PVector newArrowPos;
String mouseReceived;

// Data visualization
PFont f;

// rec mouse
int sendWait = 40; // 1/20 segundo // 50 FPS
int sendTime = 0;
int sendReset = millis();
boolean sendMouse = false;

// view animation
int receiveWait = 200; // 1/10 segundo // 5 FPS
int receiveTime = 0;
int receiveReset = millis();
boolean receiveMouse = false;
int numValuesUploaded = 0;
int delay = 250; // 10 segundos de espera antes de leer los datos

PVector arrayPos[] = new PVector[delay];
int arrayPosInt[] = new int[delay];
int counterArray = 0;

void setup(){
  size(800,600);
  frameRate(25);
  
  arrowPos = new PVector(0,0);
  newArrowPos = new PVector(0,0);
  arrow = loadImage("cursor.png");
  
  f = loadFont("ArialMT-18.vlw");
  textFont(f, 22);
  
  for(int i=0;i<delay;i++){
    arrayPos[i] = new PVector(0,0);
  }
  
}

void draw(){
  // main time
  processingTime = millis();
  
  ////////////////////////////////////////
  // receiving timelines
  receiveTime = processingTime-receiveReset;
  if(receiveTime > receiveWait){
    receiveMouse = true;
  }
  
  if(receiveMouse){
    if(numValuesUploaded > delay){
      if(counterArray < delay-1){
        counterArray++;
      }else{
        counterArray = 0;
      }
      newArrowPos.x = arrayPos[counterArray].x;
      newArrowPos.y = arrayPos[counterArray].y;
    }
    
    receiveMouse = false;
    receiveReset = millis();
  }
  ////////////////////////////////////////
  
  background(255);
  
  textAlign(LEFT);
  fill(0);
  text("Posiciones guardadas en el array: "+str(numValuesUploaded), 60, 60);
  
  arrowPos.x = arrowPos.x*0.02 + newArrowPos.x*0.98;
  arrowPos.y = arrowPos.y*0.02 + newArrowPos.y*0.98;
  
  image(arrow,arrowPos.x,arrowPos.y);
}

void mouseMoved(){
  grabMouse();
}

void grabMouse(){
  ////////////////////////////////////////
  // save mouse position timeline
  sendTime = processingTime-sendReset;
  if(sendTime > sendWait){
    sendMouse = true;
  }
  
  if(sendMouse){
    if(numValuesUploaded < delay){
      arrayPos[numValuesUploaded].x = mouseX;
      arrayPos[numValuesUploaded].y = mouseY;
    }
    
    numValuesUploaded++; // incrementa el contador de numero de datos enviados
    
    sendMouse = false;
    sendReset = millis();
  }
  ////////////////////////////////////////
  
}


