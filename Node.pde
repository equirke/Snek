class Node
{
  PVector pos;
  float fScore;
  float gScore;
  Node bestNext;
  
  Node(float x, float y, float fScore, float gScore)
  {
    pos = new PVector(x, y);
    this.fScore = fScore;
    this.gScore = gScore;
  }
}