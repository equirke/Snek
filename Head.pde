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
    
  void move()
  {
    node[pos.x][pos.y].unset(this);
    body.move(this.pos);
    if(oldDir.x == dir.x && oldDir.y == dir.y)
    {
      pos.add(oldDir);
    }
    else
    {
      pos.add(dir);
      oldDir.set(dir);
    }
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