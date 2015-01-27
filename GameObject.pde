class GameObject
{
  
  PVector pos;
  float w, h, speed;
  color colour;
  boolean alive;
  int score;
  
  GameObject()
  {
    w = 0;
    h = 0;
    colour = color(255);
    pos = new PVector(0, 0);
    alive=true;
    score=0;
  } // End default constructor.
  
  
  GameObject(PVector pos, float w, float h)
  {
    this.pos = pos;
    this.w = w;
    this.h = h;
  } // End overloaded constructor.
  
  void update()
  {
  }
  
  void display()
  {
    fill(colour);
    rect(pos.x, pos.y, w, h);
  } // End display.
} // End GameObject class.
