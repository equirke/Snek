float sqWidth;
int state = 0;
int subState = 0;
Head head;
Food food;

void setup()
{
  size(500, 500);
  sqWidth = width / 50;
  head = new Head(250.0, 250.0, sqWidth, color(0), 1);
  food = new Food(getRand(1, 24), getRand(1, 24), sqWidth, color(255, 255, 0));
}

void draw()
{
  background(255);
  food.render();
  head.render();
  
  if(frameCount % 5 == 0)
  {
    head.move();
  }
  
  if(head.eat(food.getPos()))
  {
    head.addBody();
    food = new Food(getRand(1, 24), getRand(1, 24), sqWidth, color(255, 255, 0));
  }
  
  if(head.eatSelf())
  {
    exit();
  }
}


void keyPressed()
{
  head.setDir();
}

float getRand(float low, float high)
{
  return floor(random(low, high)) * 10;
}