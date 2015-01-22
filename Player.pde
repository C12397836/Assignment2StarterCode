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
  
  int s=10;
  
  void display()
  {    
    stroke(colour);
    fill(colour);    
    ellipse(pos.x, pos.y, 40, 20);
    line(pos.x, pos.y, pos.x-40, pos.y);
    triangle(pos.x-40, pos.y, pos.x-50, pos.y, pos.x-50, pos.y-10);
    line(pos.x, pos.y, pos.x, pos.y-15);
    
    if(s%3==1)
    {
      line(pos.x-20, pos.y-10, pos.x+20, pos.y-20); //wings
      line(pos.x-20, pos.y-20, pos.x+20, pos.y-10); //wings
      s++;
    }
    else{
      line(pos.x-20, pos.y-15, pos.x+20, pos.y-15); //wings
      s++;
    }
    
    line(pos.x-10, pos.y, pos.x-10, pos.y+12); //legs
    line(pos.x+10, pos.y, pos.x+10, pos.y+12); //legs
    line(pos.x-15, pos.y+12, pos.x+15, pos.y+12); //legs
  }  
}
