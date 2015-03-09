

int tiempoAplicacion = 0;

int espera = 100; // 1 segundo
int miTiempo = 0;
int lastReset = millis();

boolean encendido = true;
float randX,randY;
int cX=0,cY=0;

PFont f;

void setup(){
  size(640, 360);
  
  f = loadFont("ArialMT-22.vlw");
  textFont(f, 22);
}


void draw(){
  
  tiempoAplicacion = millis();
  
  miTiempo = tiempoAplicacion-lastReset;
  
  if(miTiempo > espera){
    encendido = true;
  }
  
  background(0);
  
  textAlign(LEFT);
  fill(255);
  text("Processing Time (MS): "+str(tiempoAplicacion), 60, 60);
  text("My Time (MS): "+str(miTiempo), 60, 80);
  
  if(encendido){
    if(cX < int(width/30)){
      cX++;
    }else{
      cX = 0;
      if(cY < int(height/30)){
        cY++;
      }else{
        cY = 0;
      }
      
    }
    encendido = false;
    lastReset = millis();
  }
  
  ellipse(30*cX,30*cY,30,30);
  
}

void keyReleased(){
  if(key == ' '){
    encendido = true;
  }
}




