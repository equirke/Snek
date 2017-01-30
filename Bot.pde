import java.util.Stack;

class Bot extends Head
{
  ArrayList<Node> open;
  ArrayList<Node> closed;
  ArrayList<Float> fscore;
  Stack<Node> path;
  Node start;
  Node end;
  
  Bot(int x, int y, float size, color c, int bodyCount)
  {
    super(x, y, size, c, bodyCount);
    open = new ArrayList<Node>();
    closed = new ArrayList<Node>();
    path = new Stack<Node>();
    fscore = new ArrayList<Float>();
  }
  
  boolean seek()
  {
    open.clear();
    closed.clear();
    path.clear();
    fscore.clear();
    Node cur = node[pos.x][pos.y];
    fscore.add(new Float(score(cur.getPos(), end.getPos())));
    open.add(cur);
    
    while(!open.isEmpty())
    {
      float minScore = fscore.get(0).floatValue();
      int index = 0;
      for(int x = 0; x < open.size(); x++)
      {
        float y = fscore.get(x).floatValue();
        
        if(y < minScore)
        {
          //println(y);
          minScore = y;
          index = x;
        }
      }
      
      cur = open.get(index);
      
      if(cur == end)
      {
        buildPath(cur);
        return true;
      }
      
      closed.add(cur);
      open.remove(index);
      fscore.remove(index);
      IVec curPos = cur.getIVec();
      
      ArrayList<Node> neighbour = new ArrayList<Node>();
      int numNeighbour = 0;
      println(curPos.x + " " + curPos.y);
      if(curPos.x+1 < 50)
      {
        neighbour.add(node[curPos.x+1][curPos.y]);
        numNeighbour++;
      }
      if(curPos.x-1 >= 0)
      {
        neighbour.add(node[curPos.x-1][curPos.y]);
        numNeighbour++;
      }
      if(curPos.y+1 < 50)
      {
        neighbour.add(node[curPos.x][curPos.y+1]);
        numNeighbour++;
      }
      if(curPos.y-1 >= 0)
      {
        neighbour.add(node[curPos.x][curPos.y-1]);
        numNeighbour++;
      }
      
      minScore = score(node[pos.x][pos.y].getPos(), cur.getPos()) + sqWidth;
      index = 0;
      for(int x = 0; x < numNeighbour; x++)
      {        
        if(closed.contains(neighbour.get(x)))
        {
          continue;
        }
        
        if(neighbour.get(x).getBody() != null)
        {
          continue;
        }
        
        if(open.contains(neighbour.get(x)) == false)
        {
          open.add(neighbour.get(x));
          float g = score(node[pos.x][pos.y].getPos(), neighbour.get(x).getPos());
          if(g <= minScore)
          {
            index = x;
            minScore = g;
            neighbour.get(index).setCameFrom(cur);
          }
          float f = score(neighbour.get(x).getPos(), end.getPos());
          fscore.add(f);
        } 
      }
      
    }
    
    return false;
  }
  
  void buildPath(Node cur)
  {
    Node prev;
    while(cur != null && cur !=  node[pos.x][pos.y])
    {
      prev = cur;
      path.push(cur);
      cur = cur.getCameFrom();
      prev.setCameFrom(null);
      println("building");
    }
    
  }
  
  void botDir()
  {
    Node target = path.peek();
    
    if(target != null)
    {
      
      IVec targetPos = target.getIVec();
      if(node[pos.x][pos.y] == target)
      {
        path.pop();
      }
      else
      {
        if(targetPos.x < pos.x)
        {
          dir.set(-1, 0);
        }
        else if(targetPos.y < pos.y)
        {
          dir.set(0, -1);
        }
        else if(targetPos.x > pos.x)
        {
          dir.set(1, 0);
        }
        else if(targetPos.y > pos.y)
        {
          dir.set(0, 1);
        }
      }
    }
  }

  void setGoal(IVec goal)
  {
    this.end = node[goal.x][goal.y];
  }
}