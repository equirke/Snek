class IVec
{
  int x, y;
  
  IVec(int x, int y)
  {
    this.x = x;
    this.y = y;
  }
  
  IVec()
  {
    this(0,0);
  }
  
  void add(IVec ivec)
  {
    this.x += ivec.x;
    this.y += ivec.y;
  }
  
  void set(int x, int y)
  {
    this.x = x;
    this.y = y;
  }
  
  void set(IVec ivec)
  {
    this.x = ivec.x;
    this.y = ivec.y;
  }
}