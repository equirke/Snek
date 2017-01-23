class Bot extends Head
{
  ArrayList<Node> openList;
  ArrayList<Node> closedList;
  ArrayList<Node> finalPath;
  PVector goal;
  
  Bot(float x, float y, float size, color c, int bodyCount)
  {
    super(x, y, size, c, bodyCount);
    openList = new ArrayList<Node>();
    closedList = new ArrayList<Node>();
    finalPath = new ArrayList<Node>();
  }
}