public void renderGrid(Grid g) {
 for(int row = 0; row < g.gridHeight; row++) {
  for(int col = 0; col < g.gridWidth; col++) {
    stroke(50); //<>//
    switch(g.cells[row][col].type) {
      case EMPTY:
        fill(255);
        break;
      case BLOCKED:
        fill(0);
        break;
      case START:
        fill(80, 0, 200);
        break;
      case OPEN:
        fill(0, 255, 0);
        break;
      case CLOSED:
        fill(255, 0, 0);
        break;
      case FINISH:
        fill(200, 0, 80);
        break;
      case PATH:
        fill(0, 127, 127);
        break;
   }
   rect(g.horizontalScale() * col, g.verticalScale() * row, g.horizontalScale(), g.verticalScale());
  }
 }
}
