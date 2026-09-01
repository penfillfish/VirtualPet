void setup(){
  size(500, 500);
  background(255,255,255);
  smooth();
}

void drawPig(int headRadius, PVector body, PVector bodyRadius, PVector head){
  int earHeight = headRadius/2;
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

void draw(){
  drawPig(60,new PVector(250,250),new PVector(100,50),new PVector(164,196));
}
