float sqWidth;
int state = 0;
int subState = 0;
final int gHeight = 25;
final int gWidth = 25;
Head head;
Food food;
Bot bot;
Node[][] node = new Node[gHeight][gWidth];

MenuTile[] menu = new MenuTile[4];

void setup()
{
  size(500, 500);
  textAlign(CENTER, CENTER);
  sqWidth = width / 25;
  menu[0] = new MenuTile(100, 50, 300, 50, "Single Player", color(44, 224, 224), color(255));
  menu[1] = new MenuTile(100, 150, 300, 50, "VS AI", color(44, 224, 224), color(255));
  menu[2] = new MenuTile(100, 250, 300, 50, "VS AI (debug)", color(44, 224, 224), color(255));
  menu[3] = new MenuTile(100, 150, 300, 50, "Back to Menu", color(44, 224, 224), color(255));
  for(int i = 0; i < 25; i++)
  {
    for(int j = 0; j < 25; j++)
    {
      node[i][j] = new Node(sqWidth * i, sqWidth * j, i, j);
      //println(i + " " + j);
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
    frameRate(60);
      switch(subState)
      {
        case 1:
        head = new Head(15, 15, sqWidth, color(0), 1);
        placeFood();
        state = 1;
        break;
        case 2:
        bot = new Bot(15, 15, sqWidth, color(128), 1);
        head = new Head(10, 10, sqWidth, color(0), 1);
        placeFood();
        bot.setGoal(food.getPos());
        bot.seek();
        state = 2;
        break;
        case 3:
        head = null;
        bot = new Bot(15, 15, sqWidth, color(52, 192, 216), 1);
        placeFood();
        bot.setGoal(food.getPos());
        bot.seek();
        state = 3;
        frameRate(600);
        break;
        
      }
      
      for(int i = 0; i < 3; i++)
      {
        menu[i].render();
      }
    break;
    case 1:
      printScore();
      for(int i = 0; i < gHeight; i++)
      {
        for(int j = 0; j < gWidth; j++)
        {
          node[i][j].render();
        }
      }
      if(frameCount % 5 == 0)
      {
        head.move();
        if(head.eat(food))
        {
          head.addBody();
          food.unset();
          placeFood();
        }
      
        if(head.eat())
        {
          head.clear();
          subState = 0;
          state = 4;
          food.unset();
        }
      }
            
    break;
    
    case 2:
      printScore();
      
      for(int i = 0; i < gHeight; i++)
      {
        for(int j = 0; j < gWidth; j++)
        {
          node[i][j].render();
        }
      }
     
     
      if(frameCount % 5 == 0)
      {
        bot.setGoal(food.getPos());
        bot.seek();
        head.move();
                
        try
        {
          bot.botDir();
        }
        catch(EmptyStackException e)
        {
          bot.setGoal(new IVec(2, 2));
          bot.seek();
          bot.setDir();
        }
        bot.move();
                
        if(bot.eat(food))
        {
          bot.addBody();
          food.unset();
          placeFood();
        }
        
        if(head.eat(food))
        {      
          head.addBody();
          food.unset();
          placeFood();
        }
              
      }
      
      if(head.eat())
      {
        bot.clear();
        head.clear();
        subState = 0;
        state = 4;
        food.unset();
      }
      
      if(bot.eat())
      {
        bot.clear();
        head.clear();
        subState = 0;
        state = 4;
        food.unset();
      }
      
    break;
    
    case 3:
    printScore();
    
    for(int i = 0; i < gHeight; i++)
      {
        for(int j = 0; j < gWidth; j++)
        {
          node[i][j].render();
        }
      }
            
      if(frameCount % 5 == 0)
      {
        bot.setGoal(food.getPos());
        bot.seek();
        try
        {
          bot.botDir();
        }
        catch(EmptyStackException e)
        {
          bot.setGoal(new IVec(gWidth - 2, gHeight - 2));
          bot.seek();
          bot.setDir();
        }
        bot.move();        
        if(bot.eat(food))
        {
          bot.addBody();
          food.unset();
          placeFood();
          
          for(int i = 0; i < 25; i++)
          {
            for(int j = 0; j < 25; j++)
            {
              node[i][j].open = false;
              node[i][j].closed = false;
              node[i][j].path = false;
            }
          }
        }
                
        if(bot.eat())
        {
          bot.clear();
          subState = 0;
          state = 4;
          food.unset();
        }
      }
            
      break;
      
      case 4:
        menu[3].render();
        fill(0);
        if(head != null)
          text("You score is:" + head.getScore(),250, 100);
        if(bot != null)
          text("Bot's score is:" + bot.getScore(), 250, 120);
      break;
  }
}



void keyPressed()
{
  switch(state)
  {
    case 1:
    case 2:
    head.setDir();
    break;
  }
}

void mousePressed()
{
  switch(state)
  {
    case 0:
      for(int i = 0; i < 3; i++)
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
    break;
    case 4:
      PVector mpos = menu[3].getPos();
      PVector msize = menu[3].getSize();
        if(mouseX > mpos.x && mouseY > mpos.y)
        {
          if(mouseX < mpos.x + msize.x && mouseY < mpos.y + msize.y)
          {
            state = 0;
          }
        }
    break;
  }
}

int getRand(float low, float high)
{
  return floor(random(low, high));
}

float score(PVector cur, PVector goal)
{
  return PVector.dist(goal, cur);
}

void printScore()
{
  fill(0);
  if(head !=  null)
    text("Score " + head.getScore(), 25, 10);
  if(bot != null)
    text("Score " + bot.getScore(), 475, 10);
}

void placeFood()
{
  int i, j;
  i = getRand(1, gHeight - 1);
  j = getRand(1, gWidth - 1);
  
  while(node[i][j].getBody() != null || node[i][j].getHead() != null)
  {
    i = getRand(1, gHeight - 1);
    j = getRand(1, gWidth - 1);
  }
  
  food = new Food(i, j, sqWidth, color(255, 255, 0));
}