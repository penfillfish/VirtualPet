import processing.serial.*;
import cc.arduino.*;
Arduino arduino;
/* 
0:Temperature Sensor
1:RightButton
2:RightButton
3:Slide switch
4:Microphone Audio Sensor
5:Motion Sensor(0-230)
6:LeftButton
7:LeftButton
8:Returns 2
9:Capacitive Touch sensor
10:
11:Capacitive Touch sensor
12:
13:
14:
15:
*/
int x = 0;
int y = 0;
void setup(){
  size(1000, 1000);
  background(255,255,255);
  smooth();
  arduino = new Arduino(this, Arduino.list()[0], 57600);
}

void drawPig(float size){
  PVector body = new PVector(0,0);
  PVector head = new PVector(-86,-54);
  PVector bodyRadius = new PVector(100*size,50*size);
  int headRadius = (int)(60*size);
  int earHeight = (int)(headRadius/2);
  fill(253, 172, 228);
  stroke(64);

  ellipse(body.x,body.y,bodyRadius.x*2,bodyRadius.y*2); //Body
  ellipse(head.x,head.y,headRadius*2,headRadius*2); //Head
  
  pushMatrix();//Ears
  translate(head.x,head.y);
  
  rotate(radians(225));
  triangle(headRadius,0,headRadius+earHeight,earHeight-5,headRadius-(headRadius*2/15),earHeight);//Left Ear
  
  rotate(radians(75));
  triangle(headRadius,0,headRadius+earHeight,earHeight/2,headRadius-(headRadius*2/15),earHeight);//Right Ear
  popMatrix();
  
  ellipse(head.x,head.y+29,headRadius,headRadius/2); //Nose
  ellipse(head.x-15,head.y+29,15,15);//Left Nostrail
  ellipse(head.x+15,head.y+29,15,15);//Right Nostrail
  
  fill(225);
  ellipse(head.x-25,head.y-25,25,25);//Left Eye
  ellipse(head.x+25,head.y-25,25,25);//Right Eye
  
  fill(0);
  ellipse(head.x+25,head.y-20,12,12);//Left Pupil
  ellipse(head.x-25,head.y-20,12,12);//Right Pupil
  
  beginShape();//Tail
  stroke(64);
  fill(253, 172, 228);
  vertex(body.x+bodyRadius.x,body.y);//Base
  bezierVertex(body.x+bodyRadius.x+20,body.y-20,body.x+bodyRadius.x+40,body.y+20,body.x+bodyRadius.x,body.y+40); //First Curve
  bezierVertex(body.x+bodyRadius.x-20,body.y+60,body.x+bodyRadius.x+20,body.y+80,body.x+bodyRadius.x+10,body.y+100); //Second Curve
  endShape();
  
  ellipse(body.x-(bodyRadius.x/2),body.y+bodyRadius.y+25,40,100);//Front Leg
  ellipse(body.x+(bodyRadius.x/2),body.y+bodyRadius.y+25,40,100);//Back Leg
  
  fill(0);
  arc(body.x-50,body.y+125,25,25,radians(180),radians(270));//Front Toe
  arc(body.x+50,body.y+125,25,25,radians(180),radians(270));//Back Toe
}

public void draw(){
  background(224,255,255);
  fill(155, 118, 83);
  rect(0,850,1000,150);
  fill(124, 252, 0);
  rect(0,825,1000,25);
  y = arduino.analogRead(5);
  int leftButton = arduino.analogRead(6);
  int rightButton = arduino.analogRead(1);
  if (leftButton > 0){
    x-=10;
  }
  else if (rightButton > 0){
    x+=10;  
  }
  pushMatrix();
  scale(1.0);
  translate(500,500);
  translate(x,y);
  drawPig(1.0);
  popMatrix();
  y=0;
}
