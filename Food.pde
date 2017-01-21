class Food
{
  PVector pos;
  float size;
  color c;
  
  Food(float x, float y, float size, color c)
  {
    pos = new PVector(x, y);
    this.size = size;
    this.c = c;
  }
  
  void render()
  {
    fill(c);
    rect(pos.x, pos.y, size, size);
  }
  
  PVector getPos()
  {
    return pos;
  }
}