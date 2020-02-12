color[] palette = {#697780, #569486, #D1EDFF, #426880, #A6BDCB};

PFont font;

Table districts;
int rowCount;
int diameter = 10;

void setup() {
  size(1500, 400);
  districts = new Table("districts.tsv");
  rowCount = districts.getRowCount();
  font = loadFont("Corbel-18.vlw");
}

void draw() {
  background(palette[2]);
  textFont(font);
  stroke(180);
  fill(180);
  textAlign(CENTER);
  text("36k", 100, height - 10);
  text("1800k", width-100, height - 10);
  
  for(int i = 0; i < 20; i++) {    
      line(i * 80 + 100, 20, i * 80 + 100, height-30);    
  }
  
  noStroke();
  smooth();
  
  for (int row = 0; row < rowCount; row++) {
    // District names
    String districtName = districts.getString(row, 0);
    println(districtName);
    
    //Population 2011
    float yr2011 = (districts.getFloat(row, 1));
    fill(palette[3], 160);
    ellipse(100+yr2011/1410, height*.2, diameter, diameter);
    text("2011 AD", 60, height*.2+5);
    if(dist(yr2011, height*.2, mouseX, mouseY) < (diameter/2+1)) {
      text(districtName, yr2011, height*.2 - 10);
    }
  
    //Population 2001
    float yr2001 = (districts.getFloat(row, 2));
    fill(palette[0], 160);
    ellipse(100+yr2001/1410, height*.4, diameter, diameter);
    text("2001 AD", 60, height*.4+5);
    if(dist(yr2001, height*.4, mouseX, mouseY) < (diameter/2)) {
      text(districtName, yr2001, height*.4 - 10);
    }
    
    float yr1991 = (districts.getFloat(row, 3));
    fill(palette[4], 160);
    ellipse(100+yr1991/1410, height*.6, diameter, diameter);
    text("1991 AD", 60, height*.6+5);
    if(dist(yr1991, height*.6, mouseX, mouseY) < diameter/2) {
      text(districtName, yr1991, height*.6 - 10);
    }
    
    float yr1981 = (districts.getFloat(row, 4));
    fill(palette[1], 160);
    ellipse(100+yr1981/1410, height*.8, diameter, diameter);
    text("1981 AD", 60, height*.8+5);
    if(dist(yr1981, height*.8, mouseX, mouseY) < (diameter)) {
      text(districtName, yr1981, height*.8 - 10);
    }  
    noLoop();
  }
}
    
    
    
