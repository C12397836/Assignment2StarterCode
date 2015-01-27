/*
    DIT OOP Assignment 2 Starter Code
    =================================
    
    Loads player properties from an xml file
    See: https://github.com/skooter500/DT228-OOP 
*/

ArrayList<GameObject> game_objects = new ArrayList<GameObject>();
boolean[] keys = new boolean[526];
int gameState, mode;

void setup()
{
  size(1020, 600);
  
  game_objects.add(new Background());
  setUpPlayerControllers();
  
  gameState=2;
  mode=2;
}

void draw()
{ 
  background(0);
  if(gameState==1)
  {
    text("Start", 200, 200);
    rect(300, 300, 100, 100);
    if(mousePressed==true && mouseX>300 && mouseX<400 && mouseY>300 && mouseY<400)
    {
      text("dddd", 200 ,300);
    }
  }
  // Loop through all the game objects
  if(gameState==2)
  {
      for(int i = 0; i < game_objects.size(); i++)
      {
        if(game_objects.get(i) instanceof Player)
        {
          if(mode==1)
          {
            game_objects.get(2).alive=false;
          }
        }
        game_objects.get(i).update();
        game_objects.get(i).display();
      } 
    
    // End loop.
  }
  
  
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

