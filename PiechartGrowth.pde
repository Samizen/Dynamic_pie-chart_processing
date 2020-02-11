class PiechartGrowth {
//color[] palette = {#ffffd9, #edf8b1, #c7e9b4, #7fcdbb, #41b6c4, #1d91c0, #225ea8, #0c2c84};
String title;
float angleEnd;
float diameter;
float xPosition;
float yPosition;
float angleStart;
float angleMid;
int red;
int green;
int blue;
float speed;

//Constructor
PiechartGrowth(String title, float angleEnd) {
  this.title = title;
  this.angleEnd = angleEnd*PI;
  diameter = random(50, 450);
  xPosition = random((diameter/2), (width - (diameter/2))); 
  yPosition = random((diameter/2), (height - (diameter/2)));
  angleStart = 0;
  angleMid = 0;
  red = int(random(255));
  green = int(random(255));
  blue = int(random(255));
  this.title = title;
  speed += random(0.005, 0.05);
}

//Update function
void update() {
  angleMid += speed;
  angleMid = constrain(angleMid, 0, this.angleEnd);
  
  //For moving the piecharts:
  if((dist(xPosition, yPosition, mouseX, mouseY) < diameter/2) && mousePressed) {
      xPosition = xPosition + (mouseX - pmouseX);
      yPosition = yPosition + (mouseY - pmouseY);
  }
}

void display() {
  noStroke();
  fill(red, green, blue);
  arc(xPosition, yPosition, diameter, diameter, 0, angleMid);
  fill(255);
  text(title, xPosition+5, yPosition+5);
}
}
