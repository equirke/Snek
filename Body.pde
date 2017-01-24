class Body
{
  IVec pos;
  float size;
  color c;
  Body next;
  
  Body(int x, int y, float size, color c, int bodycount)
  {
      pos = new IVec(x, y);
      this.size = size;
      this.c = c;
    if(bodycount > 0)
    {
      next = new Body(x + 1, y, size, c, bodycount - 1);
    }
  }
  
  void move(IVec pos)
  {
    node[this.pos.x][this.pos.y].unset(this);
    if(next != null)
    {
      next.move(this.pos);
    }
    this.pos.set(pos);
    node[this.pos.x][this.pos.y].set(this);
    
  }
  
  void addBody()
  {
    if(next == null)
    {
      next = new Body(pos.x, pos.y, size, c, 0);
    }
    else
    {
      next.addBody();
    }
  }
  
  IVec getPos()
  {
    return pos;  
  }
  
  Body getNext()
  {
    return next;
  }
}