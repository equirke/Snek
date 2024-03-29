class Head
{
  IVec pos;
  IVec dir;
  IVec oldDir;
  float size;
  color c;
  char blockKey;
  int score;
  
  Body body;
  
  /*
    Initialises the head and calls the body
    initialiser
  */
  Head(int x, int y, float size, color c, int bodycount)
  {
    pos = new IVec(x, y);
    this.size = size;
    this.dir = new IVec(-1, 0);
    this.oldDir = new IVec(dir.x, dir.y);
    blockKey = 0;
    this.c = c;
    score = 0;
    body = new Body(x + 1, y, size, c, bodycount);
  }
   
   /*Moves the head and also moves the body
   Checks to make sure the snake is not heading
   back in on itself*/
  void move()
  {
    node[pos.x][pos.y].unset(this);
    body.move(this.pos);
    if(oldDir.x != dir.x && oldDir.y != dir.y)
    {
      oldDir.set(dir);
    }
    
    pos.add(oldDir);
    /*This unwieldy bit of maths is needed as
    the % operator returns the remainder rather
    than the modulus in java.
    Wraps the Snake to the opposite edge of
    any screen they hit*/
    pos.x = (((pos.x % gWidth) + gWidth) % gWidth);
    pos.y = (((pos.y % gHeight) + gHeight) % gHeight);
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
      score++;
      return true;
    }
    else
    {
      return false;
    }
  }
  
  boolean eat()
  {
    Body nodeBody = node[pos.x][pos.y].getBody();
    Head nodeHead = node[pos.x][pos.y].getHead();

    if(nodeBody == null || nodeHead == null)
    {
      return false;
    } 
    else
    {
      return true;
    }

  }
  
  boolean eat(Head head)
  {
    if(pos.x == head.pos.x && pos.y == head.pos.y)
    {
      return true;
    }
    
    Body cur = head.body;
    while(cur != null)
    {
      if(pos.x == cur.pos.x && pos.y == cur.pos.y)
      {
        return true;
      }
      
      cur = cur.getNext();
    }
    
    return false;
  }
  
  
  boolean eat(Bot head)
  {
    if(pos.x == head.pos.x && pos.y == head.pos.y)
    {
      return true;
    }
    
    Body cur = head.body;
    while(cur != null)
    {
      if(pos.x == cur.pos.x && pos.y == cur.pos.y)
      {
        return true;
      }
      
      cur = cur.getNext();
    }
    
    return false;
  }
  
  //Clears the Snake from the Node array
  void clear()
  {
    Body cur = this.body;
    node[pos.x][pos.y].unset(head);
    IVec clearPos;
    while(cur != null)
    {
      clearPos = cur.getPos();
      node[clearPos.x][clearPos.y].unset(cur);
      cur = cur.getNext();
    }
  }
  
  int getScore()
  {
    return score;
  }
}