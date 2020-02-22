PImage worldMap;
Table sorted_table;
float rowCount;


void setup() {
  size(1600, 900);
  background(#AFE0FF);
  worldMap = loadImage("world_map.png");
  
  
  sorted_table = new Table("Sorted_Table_manual.tsv");
  rowCount = sorted_table.getRowCount();
}

void draw() {
  background(#AFE0FF);
  worldMap.resize(width, height);
  image(worldMap, 0, 0);
  println("Mouse X: " + mouseX);
  println("Mouse Y: " + mouseY);
  for(int row = 1; row < rowCount; row++) {
    
    //Trip locations
    float locationX = sorted_table.getFloat(row , 4);
    println("locationX: " + locationX);   
    float locationY = sorted_table.getFloat(row, 5);
    println("locationY: " + locationY);
    float mappedX = map(locationX, 0, 1600, 0, width);
    println("MappedX: " + mappedX);
    float mappedY = map(locationY, 0, 900, 0, height);
    println("MappedY: " + mappedY);    
    //String countryName = sorted_table.getString(row, 3);
    //text(countryName, mappedX - 5, mappedY + 5 );
    fill(#FC030B, 20);
    ellipse(mappedX, mappedY, 10, 10);
    
    //Customer Location
    float customerLocationX = sorted_table.getFloat(row , 6);
    
    float customerLocationY = sorted_table.getFloat(row, 7);
    
    float customerMappedX = map(customerLocationX, 0, 1600, 0, width);
    
    float customerMappedY = map(customerLocationY, 0, 900, 0, height);
    
    fill(#FEFF27,30);
    ellipse(customerMappedX, customerMappedY, 10, 10);
    
    noFill();
    stroke(#5A38FA, 10);
    strokeWeight(1);
    bezier(locationX, locationY, locationX+random(15, 50), locationY+random(13,50), customerLocationX+random(15, 30), customerLocationY+random(15, 70), customerLocationX, customerLocationY);
    
  }
  noLoop();
}
