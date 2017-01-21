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
  
  void render()
  {
    fill(c);
    stroke(255);
    rect(pos.x, pos.y, size, size);
    
    if(next != null)
    {
      next.render();
    }
  }
  
  
  void move(PVector pos)
  {
    if(next != null)
    {
      next.move(this.pos);
    }
    
    this.pos.set(pos);
  }
}