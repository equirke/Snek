class Node
{
  PVector pos;
  IVec index;
  Head head;
  Body body;
  Food food;
  boolean closed;
  boolean open;
  boolean path;
  Node cameFrom;
  
  Node(float x, float y, int i, int j)
  {
    index = new IVec(i, j);
    pos = new PVector(x, y);
  }
    
  void setCameFrom(Node node)
  {
    this.cameFrom = node;
  }
  
  Node getCameFrom()
  {
    return cameFrom;
  }
  
  void set(Head head)
  {
    this.head = head;
  }
  
  void unset(Head head)
  {
    this.head = null;
  }
  
  void set(Body body)
  {
    this.body = body;
  }
  
  void unset(Body body)
  {
    this.body = null;
  }
  
  void set(Food food)
  {
    this.food = food;
  }
  
  void unset(Food food)
  {
    this.food = null;
  }
  
  void render()
  {
    if(open)
    {
      fill(0, 255, 255);
      rect(pos.x, pos.y, sqWidth-2, sqWidth-2);
    }
    
    if(closed)
    {
      fill(0, 255, 0);
      rect(pos.x, pos.y, sqWidth-2, sqWidth-2);
    }
    
    if(path)
    {
      fill(255, 0, 255);
      rect(pos.x, pos.y, sqWidth-2, sqWidth-2);
    }
    
    if(food != null)
    {
      fill(food.c);
      rect(pos.x, pos.y, sqWidth-2, sqWidth-2);
    }
    
    if(body != null)
    {
      fill(body.c);
      rect(pos.x, pos.y, sqWidth-2, sqWidth-2);
    }
      
    if(head != null)
    {
      fill(head.c);
      rect(pos.x, pos.y, sqWidth-2, sqWidth-2);
    } 
  }
  
  Body getBody()
  {
    return body;
  }
  
  Head getHead()
  {
    return head;
  }
  PVector getPos()
  {
    return pos;
  }
  
  IVec getIVec()
  {
    return index;
  }
  
}