class Head
{
  PVector pos;
  float dirX, dirY;
  float size;
  color c;
  
  Body body;
  
  Head(float x, float y, float size, color c, int bodycount)
  {
    pos = new PVector(x, y);
    this.size = size;
    this.dirX = -sqWidth;
    this.dirY = 0;
    this.c = c;
    body = new Body(x + sqWidth, y, size, c, bodycount);
  }
}