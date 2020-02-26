public class SocialMediaUnit {
  
  FloatTable socialMedia;
  FloatTable usPopulation;
  
  //Variables for social media
  float dataMin, dataMax;
  String datesMin, datesMax;

  int rowCount, columnCount;
  int columnNumber;
  String dates[];
  
  float plotX1, plotY1, plotX2, plotY2;
  
  color hexcode;
  
  float mx, my;

  SocialMediaUnit(color hexcode, int columnNumber) { 
  this.hexcode = hexcode;
  this.columnNumber = columnNumber;
  
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
  
  drawDataPoints(this.columnNumber);
  drawDataArea(this.columnNumber);
  mouseMoved();
}



void drawDataPoints(int col) {
  int rowCount = socialMedia.getRowCount();
  
  for(int row = 0; row < rowCount; row++) {
    float value = socialMedia.getFloat(row, col);
    String mediaName = socialMedia.getColumnName(col);
    float x = map(row, 0, 12, 100, width - 50);
    float y = map(value, dataMin, dataMax, plotY2, plotY1);
    stroke(0);
    strokeWeight(3);
    point(x, y);
    mouseMoved();
    if((mx>100) && (mx<(width-50))) {
      stroke(2);
      strokeWeight(2);
      line(mx, plotY2, mx, plotY1);
      println("x: " + x + " y: " + y);
      if((abs(mx-x) < 5) && (abs(my-y) < 5)){
        fill(0);
        textSize(15);
        text(mediaName, mx+26, my-40);
        text(value+"%", mx+26, my-20);
      }
  }
    
    }
}

void drawDataArea(int col) {
  fill(this.hexcode);
  noStroke();
  beginShape();
  int rowCount = socialMedia.getRowCount();
  for (int row = 0; row < rowCount; row++) {
    float value = socialMedia.getFloat(row, col);
    float x = map(row, 0, 12, 100, width - 50);
    float y = map(value, dataMin, dataMax, plotY2, plotY1);
    vertex(x, y);
  }
// Draw the lower-right and lower-left corners.
vertex(plotX2, plotY2);
vertex(100, plotY2);
endShape(CLOSE);
}

void mouseMoved() {
  mx = mouseX;
  my = mouseY;
}
}
