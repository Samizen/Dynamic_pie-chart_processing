
color[] palette = {#133463, #365FB7, #799AE0, #F4EFDC, #BA9B65};
PFont titleFont;
PFont labelFont;
PFont miniFont;

Table populationData;
int rowCount;
float mx = 79;


void setup() {
  size(1000, 600);
  populationData = new Table("population_by_year.tsv");
  rowCount = populationData.getRowCount();  //69
  titleFont = loadFont("GillSansMT-Bold-20.vlw");
  labelFont = loadFont("GillSansMT-18.vlw");  
  miniFont = loadFont("GillSansMT-12.vlw");
}

void draw() {
  background(153);
  textFont(titleFont);
  stroke(230);
  fill(230);
  textAlign(CENTER);
  text("Population of Nepal by year", width/2, 30);
  
  textFont(labelFont);
  textAlign(LEFT);
  
  //read Data for population of each year:
  for(int row = 0; row < rowCount; row++) {
    int years = populationData.getInt(row, 0);
    float populations = populationData.getFloat(row, 1);
    //println(rowCount);
    println(years);
    //println(populations);
    float x = map(populations, 8570449, 29709449, 80, width-80);
    println(x);
    float y = map(years, 2019, 1951, 80, height-180);
    println(y);
    float x2 = map(row, 0, 69, 80, width-80);
    
    float roundedPopulations = populations/1000000;
    //println(roundedPopulations);
    
    if(years % 10 == 1){
       line(x, y, width-90, y); 
       fill(palette[0], 20);
       noStroke();
       quad(x, y, width-80, y, width-80, height-80, x, height-80);
    }
        
    //X-axis label lines
    line(x2, height-80, x2, height-85);
    
    //X-axis text in difference of 10
    if((row % 10 == 0) || (row == 69)) {
      textFont(miniFont);
      println("rowCount:" +rowCount);
      stroke(255);
      fill(255);
      text(roundedPopulations, x2-20, height-60);
      println("roundedPopulations:" +roundedPopulations);
      println("x2:" + x2);
    }
    
    if((years == 1951) || (years == 2019)) {
      textFont(labelFont);
      text(years, x2-40, y);
      line(x2, y, x2, height-85);
    }
    
    
    
    
    //Information Line - with Interaction   
    if((mx > 80) && (mx < width-80)) {
      
      if(abs(mx - x) < 5) {
        strokeWeight(2);
        stroke(palette[3]);
        line(mx, y, mx, height-80);
        textFont(labelFont);
        fill(palette[3]);
        text(years, mx+10, y-65);
        text(roundedPopulations, mx + 6, y-45);
      }
    }  
     
     //Ellipse dot 
     fill(palette[1]);
     int d = 7;
     fill(230);
     ellipse(x, y, d, d);
    }
     //noLoop();
  }
  

void mouseMoved() {
  mx = mouseX;
}   

void keyPressed() {
  if(key == CODED) {
    if(keyCode == LEFT) {
      mx -= 2;
    } else if (keyCode == RIGHT) {
      mx += 2;
    }
  }
}
     
