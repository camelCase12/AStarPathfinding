
public class Cell {
  public int row, col;
  public cellType type;
  public float fcost, gcost, hcost;
  public Cell parent;
  
  public void debugInfo() {
   print("Cell -> row: " + row + ",col: " + col + ",type: " + type + "\n" + "\tfcost: " + fcost + ",gcost: " + gcost + ",hcost: " + hcost + "\n"); 
  }
  
  public Cell(int row, int col, cellType type) {
   this.row = row;
   this.col = col;
   this.type = type;
  }
}

public enum cellType {
  EMPTY, // there is nothing in the cell
  BLOCKED, // the cell is blocked by something (obstacle)
  START, // it is the starting cell for pathfinding
  OPEN, // it is an intermediate open cell for pathfinding
  CLOSED, // it is an intermediate closed cell for pathfinding
  FINISH, // it is the finishing cell for pathfinding
  PATH // once a path is found, each cell's parent will be converted to 'path' denoting the correct path
}
