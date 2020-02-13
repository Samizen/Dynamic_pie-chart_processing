// Popularity of Facebook in Nepal:
color[] palette = {#335AA6, #2A558C, #49B1F2, #85C8F2, #D9D9D9};
PFont titleFont, labelFont;

Table fbData;
int rowCount;
float mx = 20;

void setup() {
  size(600, 200);
  fbData = new Table("social_media.tsv");
  rowCount = fbData.getRowCount();
  //println(rowCount); //14
  titleFont = loadFont("SegoeUI-Bold-22.vlw");
  labelFont = loadFont("SegoeUI-12.vlw");
}

void draw() {
  background(palette[4]);
  
  //Title
  textFont(titleFont);
  stroke(palette[0]);
  fill(palette[0]);
  textAlign(CENTER);
  text("Facebook use among all Social Medias", width/2, 30);
  
  //Labels
  textFont(labelFont);
  textAlign(LEFT);
  
  //Read Popularity
  for(int row = 0; row < rowCount; row++) {
    String dates = fbData.getString(row, 0);
    //println(dates);
    float uses = fbData.getFloat(row, 1);
    float x = map(row, 0, 14, 30, 575);
    float y = map(uses, 90, 100, 150, 30);
    //println(uses);
    //noLoop();
    
    //Slicing interactions for the date
    
    strokeWeight(1);
    if((mx > 50) && (mx < 575)) {
      line(mx, 30, mx, 150);
      if(abs(mx - x) < 20) {
        fill(palette[1]);
        text(dates, mx, 50);
        text(uses, mx, 65);
      }
    }
    
    //Lines and dots
    stroke(palette[2]);
    line(x, y, x, 150);
    noStroke();
    fill(palette[2]);
    int d = 5;
    ellipse(x, y, d, d);
    
  }
    //Read Dates
    for(int row = 0; row < rowCount; row+=12) {
    String dates = fbData.getString(row, 0);
    //println(dates);
    float uses = fbData.getFloat(row, 1);
    float x = map(row, 0, 14, 30, 575);
    float y = map(uses, 90, 100, 150, 30);
    
    //Dates
    text(dates, x, 170);
    }
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

void mouseMoved() {
  mx = mouseX;
} 
    
  
    

    
  
