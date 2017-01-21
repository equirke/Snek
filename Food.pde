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
}