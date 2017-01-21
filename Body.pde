class Body
{
  PVector pos;
  float size;
  color c;
  Body next;
  
  Body(float x, float y, float size, color c, int bodycount)
  {
      pos = new PVector(x, y);
      this.size = size;
      this.c = c;
    if(bodycount > 0)
    {
      next = new Body(x + sqWidth, y, size, c, bodycount - 1);
    }
  }
}