void setup(){
  size(500, 500);
  background(255,255,255);
  smooth();
  
  fill(253, 172, 228);
  stroke(64);
  
  ellipse(250,250,200,100); //Body
  ellipse(164,196,114,114); //Head
  
  pushMatrix();
  translate(164,196);
  
  rotate(radians(225));
  triangle(57,0,87,25,50,30);//Left Ear
  
  rotate(radians(75));
  triangle(57,0,87,15,50,30);//Right Ear
  popMatrix();
  
  ellipse(164,225,65,35); //Nose
  ellipse(164-15,225,15,15);//Left Nostrail
  ellipse(164+15,225,15,15);//Right Nostrail
  fill(225);
  ellipse(164-25,196-25,25,25);//Left Eye
  ellipse(164+25,196-25,25,25);//Right Eye
  fill(0);
  ellipse(164+25,196-20,12,12);//Left Pupil
  ellipse(164-25,196-20,12,12);//Right Pupil
}

void draw(){
  
}
