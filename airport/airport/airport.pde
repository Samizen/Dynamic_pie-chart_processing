PImage worldMap;
Table sorted_table;
float rowCount;

float mx = mouseX;
float my = 0;

float dataMin = MIN_FLOAT;
float dataMax = MAX_FLOAT;


void setup() {
  size(1600, 900);
  background(#AFE0FF);
  worldMap = loadImage("world_map.png");  
  
  sorted_table = new Table("Sorted_Table_manual_1k.tsv");
  
  rowCount = sorted_table.getRowCount();
  
}

void draw() {
  background(#AFE0FF);
  worldMap.resize(width, height);
  image(worldMap, 0, 0);
  println("Mouse X: " + mouseX);
  println("Mouse Y: " + mouseY);
  
   
  for(int row = 1; row < rowCount; row++) {    
    
    float noOfOccuranceTrip = sorted_table.getFloat(row, 14);
    float noOfOccuranceCustomer = sorted_table.getFloat(row, 15);
    float mappedNoOfOccuranceTrip = map(noOfOccuranceTrip, 1, 394, 10, 25);
    float mappedNoOfOccuranceCustomer = map(noOfOccuranceCustomer, 1, 1728, 10, 45);
    
    //Trip locations
    float locationX = sorted_table.getFloat(row , 4);
    println("locationX: " + locationX);   
    float locationY = sorted_table.getFloat(row, 5);
    println("locationY: " + locationY);
    float mappedX = map(locationX, 0, 1600, 0, width);
    println("MappedX: " + mappedX);
    float mappedY = map(locationY, 0, 900, 0, height);
    println("MappedY: " + mappedY);   
    noStroke();
    fill(#FC030B, 200);
    ellipse(mappedX, mappedY, mappedNoOfOccuranceTrip, mappedNoOfOccuranceTrip);        
    
    //Customer Location
    float customerLocationX = sorted_table.getFloat(row , 6);    
    float customerLocationY = sorted_table.getFloat(row, 7);    
    float customerMappedX = map(customerLocationX, 0, 1600, 0, width);    
    float customerMappedY = map(customerLocationY, 0, 900, 0, height);    
    fill(#FEFF27,200);
    ellipse(customerMappedX, customerMappedY, mappedNoOfOccuranceCustomer, mappedNoOfOccuranceCustomer);
    
    //Trip Country Name has to print once:
            
      String tripCountryName = sorted_table.getString(row, 8);
      stroke(#111111);
      fill(#111111);
      float locationX1 = sorted_table.getFloat(row , 9);  
      float locationY1 = sorted_table.getFloat(row, 10);
      float mappedX1 = map(locationX1, 0, 1600, 0, width);
      float mappedY1 = map(locationY1, 0, 900, 0, height);    
      text(tripCountryName, mappedX1 + 9, mappedY1+5);
      
      //Customer Country Name to print once:
      String customerCountryName = sorted_table.getString(row, 11);
      stroke(#DE4343);
      fill(#DE4343);
      float locationX2 = sorted_table.getFloat(row , 12);  
      float locationY2 = sorted_table.getFloat(row, 13);
      float mappedX2 = map(locationX2, 0, 1600, 0, width);
      float mappedY2 = map(locationY2, 0, 900, 0, height);    
      text(customerCountryName, mappedX2 + 9, mappedY2+15);    
    
      
      noFill();
      
      stroke(lerpColor(#5A38FA,#FF5050, random(0,1)), 20);
      strokeWeight(1);             
      bezier(locationX, locationY, locationX+random(15, 50), locationY+random(13,50), customerLocationX+random(15, 30), customerLocationY+random(15, 70), customerLocationX, customerLocationY);
  }

  noLoop();

}

void mouseMoved() {
  mx = mouseX;
  my = mouseY;
}
