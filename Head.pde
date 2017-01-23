class Head
{
  PVector pos;
  PVector dir;
  float size;
  color c;
  char blockKey;
  
  Body body;
  
  Head(float x, float y, float size, color c, int bodycount)
  {
    pos = new PVector(x, y);
    this.size = size;
    this.dir = new PVector(-sqWidth, 0);
    blockKey = 0;
    this.c = c;
    body = new Body(x + sqWidth, y, size, c, bodycount);
  }
  
  void render()
  {
    fill(c);
    stroke(255);
    rect(pos.x, pos.y, size, size);
    body.render();
  }
  
  void move()
  {
    body.move(this.pos);
    pos.add(dir);
    /*This unweildy bit of maths is needed as
    the % operator returns the remainder rather
    than the modulus in java*/
    pos.x = (((pos.x % width) + width) % width);
    pos.y = (((pos.y % height) + height) % height);
  }
  
  void setDir()
  {
    if(key != blockKey)
    {
      switch(key)
      {
        
        case 'a':
        {
          dir.set(-sqWidth, 0);
          blockKey = 'd';
          break;
        }
        
        case 'd':
        {
          dir.set(sqWidth, 0);
          blockKey = 'a';
          break;
        }
        
        case 'w':
        {
          dir.set(0, -sqWidth);
          blockKey = 's';
          break;
        }
        
        case 's':
        {
          dir.set(0, sqWidth);
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
  
  boolean eat(PVector fpos)
  {
    if(fpos.x == pos.x && fpos.y == pos.y)
    {
      return true;
    }
    else
    {
      return false;
    }
  }
  
  boolean eatSelf()
  {
    Body cur = body;
    PVector bpos;
    while(cur != null)
    {
      bpos = cur.getPos();
      
      if(bpos.x == pos.x &&  bpos.y == pos.y)
      {
        return true;
      }
      
      cur = cur.getNext();
    }
    
    return false;
  }
  
  boolean onSelf(PVector epos)
  {
    
    if(pos.x == epos.x && pos.y == epos.y)
    {
      return true;
    }
    
    Body cur = body;
    PVector bpos;
    while(cur != null)
    {
      bpos = cur.getPos();
      
      if(bpos.x == epos.x &&  bpos.y == epos.y)
      {
        return true;
      }
      
      cur = cur.getNext();
    }
    
    return false;
  }
}