color[] palette= {#6080BF, #7798D9, #79A3D9, #A0B9D9, #D8EBF2, #314976};
PFont titleFont, labelFont, labelFont2;

Table amount;
int rowCount;
float mx = 100;

void setup() {
  size(2000, 600);
  amount = new Table("Amount_and_Occurance.tsv");
  rowCount = amount.getRowCount();
  titleFont = loadFont("LeelawadeeUI-Bold-30.vlw");
  labelFont = loadFont("LeelawadeeUI-18.vlw");
  labelFont2 = loadFont("LeelawadeeUI-Bold-19.vlw");
}

void draw() {
  background(palette[4]);
  textFont(titleFont);
  stroke(palette[5]);
  fill(palette[5]);
  textAlign(CENTER);
  text("Bookings Per Day", width/2, 60);
  
  textFont(labelFont);
  textAlign(LEFT);
  
  //Now reading the data
  for(int row = 1; row < rowCount; row++) {
    String date = amount.getString(row, 0);
    float bookingsPerDay = amount.getFloat(row, 1);
    float amountPerDay = amount.getFloat(row, 2);
    float x = map(row, 1, 366, 50, width-100);
    float y1 = map(bookingsPerDay, 46, 300, height-100, height-200);
    float y2 = map(amountPerDay, 6000, 320000, height-100, height-500);
    
    if((mx>50) && (mx < width-100)){
      stroke(palette[0]);
      strokeWeight(2);
      line(mx, 150, mx, height-50);
      if(abs(mx-x) < 2) {
        fill(palette[5]);
        textFont(labelFont2);
        text("Amount: ", mx+6, 95); 
        text("Bookings: ", mx+6, 120); 
        textFont(labelFont);
        text(amountPerDay, mx+85, 95);
        text(int(bookingsPerDay), mx+98, 120);
        //text at the bottom
        textFont(labelFont2);
        text(date, x, height-30); 
      }
    }
    
    //Design portion:
    
    //Bar chart at the back:
    stroke(palette[3],200);
    strokeWeight(4);
    strokeCap(PROJECT);
    line(x, height-50, x, y2);
    
    //BarChart at the front
    stroke(palette[0]);
    line(x, height-50, x, y1);    
  }
  
}

void mouseMoved() {
  mx = mouseX;
}
