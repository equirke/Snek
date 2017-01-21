class Head
{
  PVector pos;
  float dirX, dirY;
  float size;
  color c;
  char blockKey;
  
  Body body;
  
  Head(float x, float y, float size, color c, int bodycount)
  {
    pos = new PVector(x, y);
    this.size = size;
    this.dirX = -sqWidth;
    this.dirY = 0;
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
    pos.x += dirX;
    pos.y += dirY;
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
          dirX = -sqWidth;
          dirY = 0;
          blockKey = 'd';
          break;
        }
        
        case 'd':
        {
          dirX = sqWidth;
          dirY= 0;
          blockKey = 'a';
          break;
        }
        
        case 'w':
        {
          dirY = -sqWidth;
          dirX = 0;
          blockKey = 's';
          break;
        }
        
        case 's':
        {
          dirY = sqWidth;
          dirX = 0;
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
}