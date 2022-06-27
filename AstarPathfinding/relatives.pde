//complete and tested

public class relativeVectors { // processing is autistic and making this non-static would actually be more non-intuitive than making it static
 Vector up = new Vector(-1, 0);// = new Vector(-1, 0); // resolve this mess
 Vector upRight = new Vector(-1, 1);
 Vector right = new Vector(0, 1);
 Vector downRight = new Vector(1, 1);
 Vector down = new Vector(1, 0);
 Vector downLeft = new Vector(1, -1);
 Vector left = new Vector(0, -1);
 Vector upLeft = new Vector(-1, -1);
}



public Vector[] getRelatives(Grid gridIn, Cell c) { //all defined clockwise
  relativeVectors rv = new relativeVectors();
  Vector[] relatives;
  if(c.col == gridIn.gridWidth-1) {  // node is along the right side
    if(c.row == gridIn.gridHeight-1) { // bottom right corner
      relatives = new Vector[] { rv.left,     // 0 0 0
                                 rv.upLeft,   // 0 - -
                                 rv.up };     // 0 - x
    }
    else if (c.row == 0) { // top right corner
      relatives = new Vector[] { rv.down,     // 0 - x
                                 rv.downLeft, // 0 - -
                                 rv.left };   // 0 0 0
    }
    else { // right non-corner side
      relatives = new Vector[] { rv.down,     // 0 - -
                                 rv.downLeft, // 0 - x
                                 rv.left,     // 0 - -
                                 rv.upLeft,
                                 rv.up };
    }
  }
  else if (c.col ==  0) { // node is along the left side
    if(c.row == gridIn.gridHeight-1) { // bottom left corner
      relatives = new Vector[] { rv.up,       // 0 0 0
                                 rv.upRight,  // - - 0
                                 rv.right };  // x - 0
    }
    else if (c.row == 0) { // top left corner
      relatives = new Vector[] { rv.right,    // x - 0
                                 rv.downRight,// - - 0
                                 rv.down };   // 0 0 0
    }
    else { // left non-corner side
      relatives = new Vector[] { rv.up,       // - - 0
                                 rv.upRight,  // x - 0
                                 rv.right,    // - - 0
                                 rv.downRight,
                                 rv.down };
    }
  }
  else if (c.row == 0) { // top non-corner side
    relatives = new Vector[] { rv.right,      // - x -
                               rv.downRight,  // - - -
                               rv.down,       // 0 0 0
                               rv.downLeft,
                               rv.left };
  }
  else if (c.row == gridIn.gridHeight-1) { // bottom non-corner side
    relatives = new Vector[] { rv.left,      // 0 0 0
                               rv.upLeft,    // - - -
                               rv.up,        // - x -
                               rv.upRight, 
                               rv.right };
  }
  else { // entirely in the middle
    relatives = new Vector[] { rv.up,        // - - -
                               rv.upRight,   // - x -
                               rv.right,     // - - -
                               rv.downRight,
                               rv.down,
                               rv.downLeft,
                               rv.left,
                               rv.upLeft };
  }
  return relatives;
}
