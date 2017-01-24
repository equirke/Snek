class Head
{
  IVec pos;
  IVec dir;
  float size;
  color c;
  char blockKey;
  
  Body body;
  
  Head(int x, int y, float size, color c, int bodycount)
  {
    pos = new IVec(x, y);
    this.size = size;
    this.dir = new IVec(-1, 0);
    blockKey = 0;
    this.c = c;
    body = new Body(x + 1, y, size, c, bodycount);
  }
    
  void move()
  {
    node[pos.x][pos.y].unset(this);
    body.move(this.pos);
    pos.add(dir);
    /*This unweildy bit of maths is needed as
    the % operator returns the remainder rather
    than the modulus in java*/
    pos.x = (((pos.x % 50) + 50) % 50);
    pos.y = (((pos.y % 50) + 50) % 50);
    node[pos.x][pos.y].set(this);
  }
  
  void setDir()
  {
    if(key != blockKey)
    {
      switch(key)
      {
        
        case 'a':
        {
          dir.set(-1, 0);
          blockKey = 'd';
          break;
        }
        
        case 'd':
        {
          dir.set(1, 0);
          blockKey = 'a';
          break;
        }
        
        case 'w':
        {
          dir.set(0, -1);
          blockKey = 's';
          break;
        }
        
        case 's':
        {
          dir.set(0, 1);
          blockKey = 'w';
          break;
        }
      } 
    }
  }
  
  void addBody()
  {
    body.addBody();
  }
  
  boolean eat(Food food)
  {
    IVec fpos = food.getPos();
    if(fpos.x == pos.x && fpos.y == pos.y)
    {
      return true;
    }
    else
    {
      return false;
    }
  }
  
  void eat()
  {
    Body body = node[pos.x][pos.y].getBody();
    if(body == null)
    {
      return;
    }
    IVec fpos = body.getPos();
    
    if(fpos.x == pos.x && fpos.y == pos.y)
    {
      body = null;
    }
  }
}