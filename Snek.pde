float sqWidth;
int state = 0;
int subState = 0;
Head head;
Food food;
Node[][] node = new Node[50][50];

MenuTile[] menu = new MenuTile[2];

void setup()
{
  size(500, 500);
  textAlign(CENTER, CENTER);
  sqWidth = width / 50;
  menu[0] = new MenuTile(100, 50, 300, 50, "Single Player", color(44, 224, 224), color(255));
  menu[1] = new MenuTile(100, 150, 300, 50, "VS AI", color(44, 224, 224), color(255));
  for(int i = 0; i < 50; i++)
  {
    for(int j = 0; j < 50; j++)
    {
      node[i][j] = new Node(sqWidth * i, sqWidth * j);
    }
  }
  frameRate(60);
}

void draw()
{
  background(255);
  switch(state)
  {
    case 0:
      switch(subState)
      {
        case 1:
        head = new Head(25, 25, sqWidth, color(0), 1);
        food = new Food(getRand(1, 24), getRand(1, 24), sqWidth, color(255, 255, 0));
        state = 1;
        break;
        case 2:
        break;
      }
      
      for(int i = 0; i < 2; i++)
      {
        menu[i].render();
      }
    break;
    case 1:
      for(int i = 0; i < 50; i++)
      {
        for(int j = 0; j < 50; j++)
        {
          node[i][j].render();
        }
      }
      if(frameCount % 5 == 0)
      {
        head.move();
      }
      
     if(head.eat(food))
     {
        head.addBody();
        food.unset();
        food = new Food(getRand(1, 24), getRand(1, 24), sqWidth, color(255, 255, 0));
      }
      
      head.eat();
      
    break;
    
    case 2:   
    break;
  }
}


void keyPressed()
{
  switch(state)
  {
    case 1:
    head.setDir();
    break;
  }
}

void mousePressed()
{
  for(int i = 0; i < 2; i++)
  {
    PVector mpos = menu[i].getPos();
    PVector msize = menu[i].getSize();
    if(mouseX > mpos.x && mouseY > mpos.y)
    {
      if(mouseX < mpos.x + msize.x && mouseY < mpos.y + msize.y)
      {
        subState = i + 1;
      }
    }
  }
}

int getRand(float low, float high)
{
  return floor(random(low, high));
}

float score(PVector cur, PVector goal)
{
  goal.sub(cur);
  return (float)goal.mag();
}