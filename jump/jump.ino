#include "M5Atom.h"
#define DMX_IN 9 //dummy input 
#define DMX_OUT 26 // Serial to DMX 
CRGB dispColor( uint8_t r,uint8_t g, uint8_t b) {
  return (CRGB)((g << 16) | (r << 8) | b);
}
void hsv2rgb(byte h/*0-252*/,byte s/*0-255*/,byte v/*0-255*/, unsigned char *r, unsigned char *g, unsigned char *b){
   byte i=h/42;
   byte f=h%42;
   word tw,p1,p2,p3;  
   tw=255*42-s*42;
   p1=((unsigned long)tw*v+21*255)/42/255;
   tw=255*42-s*f;
   p2=((unsigned long)tw*v+21*255)/42/255;
   tw=255*42-s*(42-f);
   p3=((unsigned long)tw*v+21*255)/42/255;
   if(255<p1)p1=255;
   if(255<p2)p2=255;
   if(255<p3)p3=255;
   if(p1<0)p1=0;
   if(p2<0)p2=0;
   if(p3<0)p3=0;
   
   switch(i){
   case 0:
     {*r = v ;*g = p3 ;*b = p1;} 
     break;
   case 1:
     {*r = p2 ;*g = v ;*b = p1;}
     break;
   case 2:
     {*r = p1 ;*g = v;*b = p3;}
     break;
   case 3:
     {*r = p1 ;*g = p2 ;*b = v;}
     break;
   case 4:
     {*r = p3 ;*g = p1 ;*b = v;}
     break;
   default:
     {*r = v ;*g = p1 ;*b = p2;}
     break;
   }
   
}



  
void setup() {
  M5.begin(true/*Serial*/, false/*I2C}*/, true/*display*/);
  delay(10);
  Serial.begin(115200);
  pinMode(DMX_OUT, OUTPUT);
  digitalWrite(DMX_OUT, HIGH);
  pinMode(DMX_IN, INPUT_PULLUP);
  M5.IMU.Init();
  Serial.print("setup done");
}


unsigned short delta=0;
unsigned long nowMillis=0;
void deltaTick(){
  static unsigned long oldMillis=0;
  nowMillis=millis();
  delta=nowMillis-oldMillis;
  oldMillis=nowMillis;
}


short phase=0;
void loop() {
  M5.update();   
  deltaTick();
  float acc[3];
  byte dmx[512];
  static unsigned long count=0;
  static byte theH[25];
  M5.IMU.getAccelData(acc,acc+1,acc+2);
  Serial.println(acc[2]);
  if(delta<phase)phase-=delta;
  else phase=0;
  
  if(phase<10 && acc[2]<-2.0){
    phase=300;
    for(int i=0;i<25;i++){
      theH[i]=random(0,252);
      if(i && abs((byte)(theH[i] -theH[i-1]))<20){ // too near color
        theH[i]+=120;
        theH[i]%=252;
      }
    }    
  }
  byte theV=constrain(map(phase,0,300,0,500),0,255); 

   
  //Set dmx data /LED 
  for (int i=0;i<25;i++){
    byte r,g,b;
    hsv2rgb(theH[i],250,theV,&r,&g,&b);
    M5.dis.drawpix ( i,dispColor(r,g,b));      
    dmx[i*3]=r;
    dmx[i*3+1]=g;
    dmx[i*3+2]=b;
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
