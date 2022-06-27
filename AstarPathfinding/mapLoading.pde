Cell[][] loadMap(String filePath) { // reads a txt file into a 2d cell[]
  String[] lines = loadStrings(filePath);
  Cell[][] grid = new Cell[lines.length][lines[0].split(",").length];
  for(int i = 0; i < lines.length; i++) {
   String[] cells = lines[i].split(","); 
   for(int j = 0; j < cells.length; j++) {
    grid[i][j] =  createCell(cells[j], i, j);
   }
  }
  return grid;
}

Cell createCell(String in, int row, int col) {
 if(in.equals("0")) {
  return new Cell(row, col, cellType.EMPTY);
 }
 else {
  return new Cell(row, col, cellType.BLOCKED); 
 }
}
