color[] palette = {#1E2022, #E6DAC6, #55573E, #F6CE8D, #FFCC00};

Table districtArea;
int rowCount;

void setup() {
  size(1000, 1000);
  districtArea = new Table("districts.tsv");
  rowCount = districtArea.getRowCount();
  println("Row Count = " + rowCount);
}

void draw() {
  background(palette[3]);
  fill(palette[0], 150);
  noStroke();
  //smooth();
  
  for(int row = 0; row < rowCount; row++) {
    String district = districtArea.getString(row, 0);
    float area = districtArea.getFloat(row, 5);
    float population = districtArea.getFloat(row, 1);
    fill(palette[0]);
    ellipse(width-area/7, population/2000, 20, 20);
    //text(district, (area/10)+5, (population/3000)+5);
    println(area +","+population);
    text("Area", width/2, height-10);
    text("Population", 30, height/2);
  }
  
  noLoop();
}
  
