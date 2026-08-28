void setup(){
  int headRadius = 60;
  int earHeight = headRadius/2;
  PVector body = new PVector(350,250);
  PVector head = new PVector(164,196);
  size(500, 500);
  background(255,255,255);
  smooth();
  
  fill(253, 172, 228);
  stroke(64);
  
  ellipse(body.y,body.y,200,100); //Body
  ellipse(head.x,head.y,headRadius*2,headRadius*2); //Head
  
  pushMatrix();//Ears
  translate(head.x,head.y);
  
  rotate(radians(225));
  triangle(headRadius,0,headRadius+earHeight,earHeight-5,headRadius-(headRadius*2/15),earHeight);//Left Ear
  
  rotate(radians(75));
  triangle(headRadius,0,headRadius+earHeight,earHeight/2,headRadius-(headRadius*2/15),earHeight);//Right Ear
  popMatrix();
  
  ellipse(head.x,225,headRadius,headRadius/2); //Nose
  ellipse(head.x-15,225,15,15);//Left Nostrail
  ellipse(head.x+15,225,15,15);//Right Nostrail
  
  fill(225);
  ellipse(head.x-25,head.y-25,25,25);//Left Eye
  ellipse(head.x+25,head.y-25,25,25);//Right Eye
  
  fill(0);
  ellipse(head.x+25,head.y-20,12,12);//Left Pupil
  ellipse(head.x-25,head.y-20,12,12);//Right Pupil
  
  beginShape();//Tail
  stroke(64);
  fill(253, 172, 228);
  vertex(350,250);//Base
  bezierVertex(body.x+20,body.y-20,body.x+40,body.y+20,body.x,body.y+40); //First Curve
  bezierVertex(body.x-20,body.y+60,body.x+20,body.y+80,body.x+10,body.y+100); //Second Curve
  endShape();
  
  ellipse(200,325,40,100);//Front Leg
  ellipse(300,325,40,100);//Back Leg
  
  fill(0);
  arc(200,375,25,25,radians(180),radians(270));//Front Toe
  arc(300,375,25,25,radians(180),radians(270));//Back Toe
}

void draw(){
  
}
