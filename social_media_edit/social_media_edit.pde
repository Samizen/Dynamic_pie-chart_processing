FloatTable socialMedia;


float dataMin, dataMax;
  String datesMin, datesMax;

  int rowCount, columnCount;
  int columnNumber;
  String dates[];
  
  float plotX1, plotY1, plotX2, plotY2;
  
  String hexcode;
  
  float mx, my;


SocialMediaUnit facebook;
SocialMediaUnit twitter;
SocialMediaUnit pinterest;
SocialMediaUnit instagram;
SocialMediaUnit youtube;
SocialMediaUnit reddit;



void setup() {
  size(800, 300);
  smooth();
  
  
  socialMedia = new FloatTable("social_media-US-monthly-201901-202001.tsv");
  rowCount = socialMedia.getRowCount();
  
  //For Social Media 
  socialMedia = new FloatTable("social_media-US-monthly-201901-202001.tsv");
  rowCount = socialMedia.getRowCount();
  columnCount = socialMedia.getColumnCount();  
  
  dates = socialMedia.getRowNames();
  datesMin = dates[0];
  datesMax = dates[dates.length-1];  
  
  dataMin = socialMedia.getTableMin();
  dataMax = socialMedia.getTableMax();
  
  plotX1 = 50; //How much gap from the left of the screen
  plotY1 = 150; //Gap from the top of the screen
  plotX2 = width - plotX1;
  plotY2 = height - 50; 
}

void draw() {
  background(244); 
  title();
  drawYearLabels();
  drawVolumeLabels();
  smooth();
  
  facebook = new SocialMediaUnit(#4267B2, 0);
  pinterest = new SocialMediaUnit(#BD081C, 1);
  twitter = new SocialMediaUnit(#1DA1F2, 2);
  instagram = new SocialMediaUnit(#FFDC80, 3);
  reddit = new SocialMediaUnit(#FF4500, 4);
  youtube = new SocialMediaUnit(#FF0000, 5);
}

void title(){
  fill(0);
  textAlign(CENTER);
  textSize(20);
  text("Social Media Users by Percentage in US", width/2, 30);
}


void drawYearLabels() {
  fill(0);
  textSize(10);
  textAlign(CENTER, TOP);
  
  stroke(224);
  strokeWeight(1);
  
  int rowCount = socialMedia.getRowCount();
  
  for(int row = 0; row < rowCount; row++) {
      float x = map(row, 0, 12, 100, width-50);
      text(dates[row], x, plotY2 + 10);
      line(x, 50, x, plotY2);    
  }
}

void drawVolumeLabels() {
fill(50);
textSize(10);
textAlign(RIGHT, CENTER);
for (float p = 0; p < 101; p += 25) {
  float y = map(p, 0, 100, plotY2, 50);
  text(int(p), plotX1 + 40, y);
  textSize(10);
  textAlign(CENTER, CENTER);
  text("Percentage\nof social\nmedia users",45, height/2);
  }
}

//void mouseMoved() {
//  mx = mouseX;
//  my = mouseY;
//}
