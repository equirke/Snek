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
    dirX = 0;
    dirY = 0;
    if(key == 'a')
    {
      dirX = -sqWidth;
    }
    
    if(key == 'd')
    {
      dirX = sqWidth;
    }
    
    if(key == 'w')
    {
      dirY = -sqWidth;
    }
    
    if(key == 's')
    {
      dirY = sqWidth;
    }
    
  }
  
  void addBody()
  {
    body.addBody();
  }
}