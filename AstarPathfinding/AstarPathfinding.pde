//parameters:
public int gridWidth = 20; // the quantity of cells horizontally
public int gridHeight = 20; // the quantity of cells vertically

// end parameters
Boolean startPassed = false;
Boolean endPassed = false;

Grid myGrid;

public void setup() {
 size(750, 750);
 background(0);
 myGrid = new Grid(25, 25);
 myGrid.initializeRandom(); //this line is for random initialization
 myGrid.cells = loadMap("test1.txt");
 //myGrid.setWidthAndHeight();
}

public void draw() {
  renderGrid(myGrid); 
  if(endPassed==true) {
    for(int i = 0; i < 2500; i++) {
     aStarIterate(myGrid);
    }
  }
}

public void mousePressed() {
  if(mouseButton==LEFT) {
    if(!startPassed) {
     myGrid.passStart(mouseX, mouseY); 
     startPassed = true;
    }
    else if(!endPassed) {
     myGrid.passEnd(mouseX, mouseY); 
     endPassed = true;
    }
    else {
     myGrid.passChange(mouseX, mouseY); 
    }
  }
}
public void keyPressed() {
 if(key==' ' && endPassed==true) {
  aStarIterate(myGrid);
 }
}
