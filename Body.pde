class Body
{
  IVec pos;  //Stores the Objects position in the node array
  float size;
  color c;
  Body next; //stores the next body in the Snake
  
  /*
    Recursivly initialises the bodies.
    It will end when bodycount = 0
  */
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
  /*
    Moves each body part in the snake recursively
    Each part sets its position on the node
    and unsets the previous body part in the
    particular node
  */
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
  
  /*
    Gets called recursively until next == null,
    next is then initialised to a new body part
  */
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