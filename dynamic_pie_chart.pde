// Dynamic Pie Chart

void setup() {
  size(600, 600);
}

//Pie Chart Initiation - constructor parameters title, angle in radian(0-2)
PiechartGrowth pie1 = new PiechartGrowth("1st Piechart",0.5);
PiechartGrowth pie2 = new PiechartGrowth("2nd Piechart",0.75);
PiechartGrowth pie3 = new PiechartGrowth("3rd Piechart",0.20);
PiechartGrowth pie4 = new PiechartGrowth("4th Piechart",1.5);
PiechartGrowth pie5 = new PiechartGrowth("5th Piechart",0.8);


//Call to two functions for each pie chart
void draw() {
  background(150);
  pie1.update();
  pie1.display();
  
  pie2.update();
  pie2.display();
  
  pie3.update();
  pie3.display();
  
  pie4.update();
  pie4.display();
  
  pie5.update();
  pie5.display();
}
