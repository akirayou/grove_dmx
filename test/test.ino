#include "M5Atom.h"
#define DMX_IN 9 //dummy input 
#define DMX_OUT 26 // Serial to DMX 

void setup() {
  M5.begin();
  delay(10);
  Serial.begin(115200);
  pinMode(DMX_OUT, OUTPUT);
  digitalWrite(DMX_OUT, HIGH);
  pinMode(DMX_IN, INPUT_PULLUP);
  M5.IMU.Init();
   
}


float acc[3];
byte dmx[512];
void loop() {
  M5.update();      // update button state

  
  //Set dmx data 
  float p=(millis()%2000)*3.1415*2.0/2000.0 ;
  for (int i=0;i<512/3;i++){
    dmx[i*3]=127+127*sin(p);
    dmx[i*3+1]=127+127*sin(p+3.1415*2.0/3);
    dmx[i*3+2]=127+127*sin(p+3.1415*4.0/3);
  }
  
  //write dmx data
  Serial2.flush(); 
  Serial2.begin(90000, SERIAL_8N2, DMX_IN/*rx*/,DMX_OUT/*tx*/,true);
  Serial2.write(0);
  Serial2.flush(); 
  Serial2.begin(250000, SERIAL_8N2, DMX_IN/*rx*/,DMX_OUT/*tx*/,true);
  Serial2.write(0);
  Serial2.write(dmx,512);

  delay(1);
   
}
