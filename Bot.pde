/*A stack is used for storing the path
as the path is contructed in reverse*/
import java.util.Stack; 
/*If no path is made then the stack
will be empty. This exception is caught 
in the mainfile(Snek.pde)*/
import java.util.EmptyStackException;

class Bot extends Head
{
  ArrayList<Node> open;  //open list(All nodes available to check)
  ArrayList<Node> closed; //closed list(All nodes already checked)
  ArrayList<Float> fscore; //stores the distance from the goal for all nodes
  Stack<Node> path; //stores the path created for the node
  Node start; //The start point
  Node end; //The end
  
  /*Initialises the Bot and the super class.*/
  Bot(int x, int y, float size, color c, int bodyCount)
  {
    super(x, y, size, c, bodyCount);
    open = new ArrayList<Node>();
    closed = new ArrayList<Node>();
    path = new Stack<Node>();
    fscore = new ArrayList<Float>();
  }
  
  /*Pathfinding Algorithm. It is best first search*/
  boolean seek()
  {
    //Clears all the lists and the path stack
    open.clear();
    closed.clear();
    path.clear();
    fscore.clear();
    //Finds the node currenlty occupied
    //by the Snakes head
    Node cur = node[pos.x][pos.y];
    //Calculates the fscore
    fscore.add(new Float(score(cur.getPos(), end.getPos())));
    //Adds itself to the openList
    open.add(cur);
    
    //While there is still nodes in the empty list
    while(!open.isEmpty())
    {
      //Chose the one Node with the smallest fscore
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
      
      //cur now equals this node with 
      //the best score
      cur = open.get(index);
      
      //If we have found the end
      if(cur == end)
      {
        //Construct a path to it based on what we've done
        buildPath(cur);
        return true;
      }
      
      //We've checked the cur, add it to closed list
      //Remove it from the open list
      closed.add(cur);
      //for debug display
      cur.closed = true;
      open.remove(index);
      fscore.remove(index);
      //get the location of the current
      IVec curPos = cur.getIVec();
      //Make a new list for neighbouring Nodes
      ArrayList<Node> neighbour = new ArrayList<Node>();
      int numNeighbour = 0;
      //println(curPos.x + " " + curPos.y);
      
      //Foreach neighbour that is not out
      //of bounds. Add it to the neighbours list
      if(curPos.x+1 < gWidth)
      {
        neighbour.add(node[curPos.x+1][curPos.y]);
        numNeighbour++;
      }
      if(curPos.x-1 >= 0)
      {
        neighbour.add(node[curPos.x-1][curPos.y]);
        numNeighbour++;
      }
      if(curPos.y+1 < gHeight)
      {
        neighbour.add(node[curPos.x][curPos.y+1]);
        numNeighbour++;
      }
      if(curPos.y-1 >= 0)
      {
        neighbour.add(node[curPos.x][curPos.y-1]);
        numNeighbour++;
      }
      
      //The minScore (g Score) here is the Node's distance
      //to the Snake's head
      minScore = score(node[pos.x][pos.y].getPos(), cur.getPos()) + (sqWidth);
      index = 0;
      for(int x = 0; x < numNeighbour; x++)
      {        
        if(closed.contains(neighbour.get(x)))
        {
          continue;
        }
        
        if(neighbour.get(x).getBody() != null)
        {
          closed.add(neighbour.get(x));
          neighbour.get(x).closed = true;
          continue;
        }
        
        if(neighbour.get(x).getHead() != null)
        {
          closed.add(neighbour.get(x));
          neighbour.get(x).closed = true;
          continue;
        }
        
        /*If the neighbours g Score is better than the current's 
        g Score, point it to the current node. This will later
        be used to reconstruct the path*/
        if(open.contains(neighbour.get(x)) == false)
        {
          open.add(neighbour.get(x));
          neighbour.get(x).open = true;
          float g = score(node[pos.x][pos.y].getPos(), neighbour.get(x).getPos());
          if(g <= minScore)
          {
            neighbour.get(x).setCameFrom(cur);
          }
          float f = score(neighbour.get(x).getPos(), end.getPos());
          fscore.add(f);
        } 
      }
      
    }
    
    return false;
  }
  
  /*Reubuilds the path based 
  on the cameFrom node set in the
  seek()function for every Node*/
  void buildPath(Node cur)
  {
    Node prev;
    while(cur != null && cur !=  node[pos.x][pos.y])
    {
      prev = cur;
      path.push(cur);
      cur = cur.getCameFrom();
      prev.setCameFrom(null);
      //These booleans aree for debug
      prev.path = true;
      prev.closed = false;
      prev.open = false;
      //println("building");
    }
    
  }
  
  /*Sets the Bots direction towards the
  last node peeked on the stack
  If we reach the node we pop the stack
  to bring the next node to the top of 
  the stack*/
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