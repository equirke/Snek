class Food
{
  IVec pos;
  float size;
  color c;
  
  Food(int x, int y, float size, color c)
  {
    pos = new IVec(x, y);
    this.size = size;
    this.c = c;
    node[x][y].set(this);
  }
    
  IVec getPos()
  {
    return pos;
  }
  
  void unset()
  {
    node[pos.x][pos.y].unset(this);
  }
}