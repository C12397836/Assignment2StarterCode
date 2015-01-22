class Player extends GameObject
{
  
  char up;
  char down;
  char left;
  char right;
  char start;
  char button1;
  char button2;
  int index;
  float yVel;
    
  Player()
  {
    yVel = 0;
    speed = 5;
    pos = new PVector(width / 2, height / 2);
  }
  
  Player(int index, color colour, char up, char down, char left, char right, char start, char button1, char button2)
  {
    this();
    this.index = index;
    this.colour = colour;
    this.up = up;
    this.down = down;
    this.left = left;
    this.right = right;
    this.start = start;
    this.button1 = button1;
    this.button2 = button2;
  }
  
  Player(int index, color colour, XML xml)
  {
    this(index
        , colour
        , buttonNameToKey(xml, "up")
        , buttonNameToKey(xml, "down")
        , buttonNameToKey(xml, "left")
        , buttonNameToKey(xml, "right")
        , buttonNameToKey(xml, "start")
        , buttonNameToKey(xml, "button1")
        , buttonNameToKey(xml, "button2")
        );
  }
  
  void update()
  {
    yVel *=0.96;
    if (checkKey(up))
    {
      yVel-=0.5;
      
    }
    else{
      yVel+=0.1;
    }
    
    if (checkKey(down))
    {
      yVel += 0.5;
    }
    if (checkKey(left))
    {
      pos.x -= speed;
    }    
    if (checkKey(right))
    {
      pos.x += speed;
    }
    if (checkKey(start))
    {
      println("Player " + index + " start");
    }
    if (checkKey(button1))
    {
      println("Player " + index + " button 1");
    }
    if (checkKey(button2))
    {
      println("Player " + index + " butt2");
    } 
    
    pos.y += yVel;   
  }
  
  void display()
  {    
    stroke(colour);
    fill(colour);    
    ellipse(pos.x, pos.y, 20, 20);
  }  
}
