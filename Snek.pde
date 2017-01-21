float sqWidth;
Head head;

void setup()
{
  size(500, 500);
  sqWidth = width / 50;
  head = new Head(250.0, 250.0, sqWidth, color(0), 1);
  
}

void draw()
{
  background(255);
  head.render();
  
  if(frameCount % 5 == 0)
  {
    head.move();
  }
}

void keyReleased()
{
  head.setDir();
}