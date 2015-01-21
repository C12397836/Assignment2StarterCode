/*
    DIT OOP Assignment 2 Starter Code
    =================================
    
    Loads player properties from an xml file
    See: https://github.com/skooter500/DT228-OOP 
*/

PVector gravity;
ArrayList<GameObject> game_objects = new ArrayList<GameObject>();
boolean[] keys = new boolean[526];

void setup()
{
  size(600, 600);
  gravity = new PVector(0, 2);
  
  game_objects.add(new Background());
  setUpPlayerControllers();
}

void draw()
{
  background(0);
  
  // Loop through all the game objects
  for(int i = 0; i < game_objects.size(); i++)
  {
    
    if(game_objects.get(i) instanceof Player)
    {
      //game_objects.get(i).pos.add(gravity);
    }
    
    
    game_objects.get(i).update();
    game_objects.get(i).display();
  } // End loop.
  
  
}

void keyPressed()
{
  keys[keyCode] = true;
}

void keyReleased()
{
  keys[keyCode] = false;
}

boolean checkKey(char theKey)
{
  return keys[Character.toUpperCase(theKey)];
}

char buttonNameToKey(XML xml, String buttonName)
{
  String value =  xml.getChild(buttonName).getContent();
  if ("LEFT".equalsIgnoreCase(value))
  {
    return LEFT;
  }
  if ("RIGHT".equalsIgnoreCase(value))
  {
    return RIGHT;
  }
  if ("UP".equalsIgnoreCase(value))
  {
    return UP;
  }
  if ("DOWN".equalsIgnoreCase(value))
  {
    return DOWN;
  }
  //.. Others to follow
  return value.charAt(0);  
}

void setUpPlayerControllers()
{
  XML xml = loadXML("arcade.xml");
  XML[] children = xml.getChildren("player");
  int gap = width / (children.length + 1);
  
  for(int i = 0 ; i < children.length ; i ++)  
  {
    XML playerXML = children[i];
    Player p = new Player(
            i
            , color(random(0, 255), random(0, 255), random(0, 255))
            , playerXML);
    int x = (i + 1) * gap;
    p.pos.x = x;
    p.pos.y = 300;
   game_objects.add(p);         
  }
}

