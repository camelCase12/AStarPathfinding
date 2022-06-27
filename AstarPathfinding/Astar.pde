public void aStarIterate(Grid gridIn) {
  if(gridIn.openNodes.length >0 && !gridIn.solved) {// second iteration, also checks if the path has been found
    float lowestFCost = gridIn.openNodes[0].fcost;
    int lowestFCostIndex = 0;
    if(gridIn.openNodes.length>1) {
      for(int i = 0; i < gridIn.openNodes.length; i++) {
        if(gridIn.openNodes[i].fcost < lowestFCost) {
         lowestFCost = gridIn.openNodes[i].fcost; 
         lowestFCostIndex = i;
        }
      }
    }
    println(gridIn.openNodes.length);
    openAroundOpenNode(gridIn, lowestFCostIndex);
  }
  else if(!gridIn.solved) { // first iteration
    openAroundStartNode(gridIn);
  }
 
}
public void openAroundOpenNode(Grid gridIn, int openNodeIndex) {
  // goals:
  //   1. open all empty nodes around, avoiding blocked nodes
  //   2. become a closed node
  //   3. update open and closed nodes with any better fcosts
  //   4. avoid start node
  //   5. detect end node

  Vector[] relatives = getRelatives(gridIn, gridIn.openNodes[openNodeIndex]);
  for(int i = 0; i < relatives.length; i++) {
   int rowVariation = relatives[i].x;
   int colVariation = relatives[i].y;
   int startRow = gridIn.openNodes[openNodeIndex].row;
   int startCol = gridIn.openNodes[openNodeIndex].col;
   int relativeCellRow = startRow + rowVariation;
   int relativeCellCol = startCol + colVariation;
   Cell relativeCell = gridIn.cells[relativeCellRow][relativeCellCol];
   cellType relativeCellType = relativeCell.type; //<>//
   if(relativeCellType == cellType.FINISH) { // a path has been successfully found
     //write code to end cell structure
     gridIn.solved = true; // marks the grid as solved
     Cell recursingCell = gridIn.openNodes[openNodeIndex];
     while(recursingCell.type!=cellType.START) { // propogates backwards until it reaches the starting cell
       recursingCell.type = cellType.PATH; // set cell to PATH
       recursingCell = recursingCell.parent; // propogate back one step
     }
     return;// prevents the last path cell from being turned into a closed cell/at this point the program is essentially complete
   }
   else if (relativeCellType == cellType.EMPTY) {
        relativeCell.parent = gridIn.openNodes[openNodeIndex];
        relativeCell.gcost = gcost(relativeCell, rowVariation, colVariation);
        relativeCell.hcost = hcost(relativeCell, gridIn.endNode); // sets the three costs for the open cell
        relativeCell.fcost = fcost(relativeCell, gridIn.endNode, rowVariation, colVariation);
        relativeCell.type = cellType.OPEN;
        gridIn.addOpenNode(relativeCellRow, relativeCellCol);
        gridIn.cells[relativeCellRow][relativeCellCol].debugInfo(); // debug
   }
   else if (relativeCellType == cellType.OPEN) {
     //write special code to overwrite open node if fcost is better
     Cell tempParent = relativeCell.parent;
     relativeCell.parent = gridIn.openNodes[openNodeIndex];
     float experimentalFCost = fcost(relativeCell, gridIn.endNode, rowVariation, colVariation);
     if(experimentalFCost < relativeCell.fcost) {
       relativeCell.fcost = experimentalFCost;
     }
     else {
      gridIn.cells[relativeCellRow][relativeCellCol].parent = tempParent;
     }
   }
   else {
     
   }
  }
  gridIn.openNodes[openNodeIndex].type = cellType.CLOSED;
  gridIn.addClosedNode(openNodeIndex);
}

public void openAroundStartNode(Grid gridIn) {
   gridIn.startNode.debugInfo(); // debug
    Vector[] relatives = getRelatives(gridIn, gridIn.startNode); // array of values from -1 to 1 which define the cells surrounding the given cell
    for(int i = 0; i < relatives.length; i++) {
      int rowVariation = relatives[i].x;
      int colVariation = relatives[i].y;
      int startRow = gridIn.startNode.row;
      int startCol = gridIn.startNode.col;
      int relativeCellRow = startRow + rowVariation;
      int relativeCellCol = startCol + colVariation;
      Cell relativeCell = gridIn.cells[relativeCellRow][relativeCellCol];
      cellType relativeCellType = relativeCell.type;
      if(relativeCellType != cellType.BLOCKED) { // if the cell under question is not blocked
        relativeCell.parent = gridIn.startNode;
        relativeCell.gcost = gcost(relativeCell, rowVariation, colVariation);
        relativeCell.hcost = hcost(relativeCell, gridIn.endNode); // sets the three costs for the open cell
        relativeCell.fcost = fcost(relativeCell, gridIn.endNode, rowVariation, colVariation);
        relativeCell.type = cellType.OPEN;
        gridIn.addOpenNode(relativeCellRow, relativeCellCol);
        relativeCell.parent = gridIn.cells[startRow][startCol];
        relativeCell.debugInfo(); // debug
      }
    } 
}
