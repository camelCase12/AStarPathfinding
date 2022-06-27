public float gcost(Cell c, int relativeX, int relativeY) { 
  // c-> cell to calculate cost for
  // start -> cell used for relative calculations
  float currentStep = sqrt(relativeX*relativeX + relativeY*relativeY);
  float previousStep;
  if(c.parent.type == cellType.START) {
    previousStep = 0;
  }
  else {
    previousStep = c.parent.gcost;
  }
  return currentStep + previousStep; // distance formula between cells
}

public float hcost(Cell c, Cell end) {
  // c-> cell to calculate cost for
  // end -> cell used for relative calculations
  return sqrt((end.col - c.col)*(end.col-c.col) + (end.row-c.row)*(end.row-c.row));
}

public float fcost(Cell c, Cell end, int relativeX, int relativeY) {
  return gcost(c, relativeX, relativeY) + hcost(c, end);
}
