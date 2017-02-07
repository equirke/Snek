/*
  Used to diplay menu options
*/
class MenuTile
{
  PVector pos;
  PVector size;
  String menuText;
  color c;
  color font;
  
  MenuTile(float x, float y, float xSize, float ySize,
  String menuText, color c, color font)
  {
    this.pos = new PVector(x, y);
    this.size = new PVector(xSize, ySize);
    this.menuText = menuText;
    this.c = c;
    this.font = font;
  }
  
  void render()
  {
    fill(c);
    rect(pos.x, pos.y, size.x, size.y);
    fill(font);
    text(menuText, pos.x + (size.x /2), pos.y + (size.y /2));
  }
  
  PVector getPos()
  {
    return pos;
  }
  
  PVector getSize()
  {
    return size;
  }
}