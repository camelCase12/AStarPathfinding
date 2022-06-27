public class Grid {
  public int gridHeight, gridWidth;
  public Cell[][] cells;
  public Cell[] openNodes = new Cell[0];
  public Cell[] closedNodes = new Cell[0];
  public Cell startNode;
  public Cell endNode;
  public Boolean solved = false;
  public float horizontalScale() {
    return width / gridWidth;
  }
  public float verticalScale() {
   return height / gridHeight; 
  }
  public void setWidthAndHeight() {
   this.gridWidth = cells[0].length;
   this.gridHeight = cells[1].length;
  }
  
  public void addOpenNode(int row, int col) { 
    openNodes = (Cell[]) expand(openNodes, openNodes.length + 1); // result has to be cast from Object[] to Cell[] ... this language is starting to cause my insides to rupture
    openNodes[openNodes.length - 1] = cells[row][col];
  }
  public void addClosedNode(int openNodeIndex) {
    //closedNodes = (Cell[]) expand(closedNodes, closedNodes.length +1);
    //closedNodes[closedNodes.length - 1] = openNodes[openNodeIndex];
    removeOpenNode(openNodeIndex);
  }
  public void removeOpenNode(int openNodeIndex) {
    for(int i = openNodeIndex; i < openNodes.length-1; i++) {
     openNodes[i]=openNodes[i+1];
    }
    println("1:"+openNodes.length);
    openNodes = (Cell[])shorten(openNodes);
    println("2:"+openNodes.length);
  }
  
  public void passStart(int x, int y) {
   int cellX = floor(x/horizontalScale()); 
   int cellY = floor(y/verticalScale());
   cells[cellY][cellX].type = cellType.START;
   startNode = cells[cellY][cellX];
  }
  public void passEnd(int x, int y) {
   int cellX = floor(x/horizontalScale()); 
   int cellY = floor(y/verticalScale());
   cells[cellY][cellX].type = cellType.FINISH;
   endNode = cells[cellY][cellX]; 
  }
  public void passChange(int x, int y) {
   int cellX = floor(x/horizontalScale()); 
   int cellY = floor(y/verticalScale());
   if(cells[cellY][cellX].type == cellType.BLOCKED) {
    cells[cellY][cellX].type = cellType.EMPTY; 
   }
   else if(cells[cellY][cellX].type == cellType.EMPTY) {
    cells[cellY][cellX].type = cellType.BLOCKED; 
   } 
  }
  
  public void initializeRandom() { // initializes with randomly placed startpoint, endpoint, and obstacles
    for(int row = 0; row < gridHeight; row++) {
     for(int col = 0;  col < gridWidth; col++) {
       if(random(1) > 0.85) {
         cells[row][col] = new Cell(row, col, cellType.BLOCKED);
       }
       else {
         cells[row][col] = new Cell(row, col, cellType.EMPTY); 
       }
     }
    }
  }
  Grid(int gridHeight, int gridWidth) {
    this.gridHeight = gridHeight;
    this.gridWidth = gridWidth;
    cells = new Cell[gridHeight][gridWidth];
  }
}
