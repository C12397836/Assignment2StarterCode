ArrayList<GameObject> game_objects = new ArrayList<GameObject>();
boolean[] keys = new boolean[526];
int gameState, mode;

void setup()
{
  size(1020, 600);
  
  game_objects.add(new Background());
  setUpPlayerControllers();
  
  gameState=1;
  mode=2;
}

void draw()
{ 
  background(0);
  if(gameState==1)
  {
    PFont mono;
    mono = loadFont("Stencil-48.vlw");
    textFont(mono);  
    textSize(100);
    text("Start", 350, 200);
    textSize(50);
    text("1 Plyr", 300, 500);
    text("2 Plyr", 600, 500);
    if(mouseX>300 && mouseX<500 && mouseY>450 && mouseY<500)
    {
      textSize(20);
      text("Click to Start!", 300, 520);
      if(mousePressed==true)
      {
        gameState=2;
        mode=1;
      }
    }
    if(mouseX>600 && mouseX<800 && mouseY>450 && mouseY<500)
    {
      textSize(20);
      text("Click to Start!", 600, 520);
      if(mousePressed==true)
      {
        gameState=2;
        mode=2;
      }
    }
    game_objects.get(1).update();
    game_objects.get(1).colour=color(255,0,0);
    game_objects.get(2).update();
    game_objects.get(2).colour=color(0,0,255);
  }
  // Loop through all the game objects
  if(gameState==2)
  {
      for(int i = 0; i < game_objects.size(); i++)
      {
        //if(game_objects.get(i) instanceof Player)
        //{
          if(game_objects.get(i).pos.y>/*game_objects.get(1).currentHeight*/height|| game_objects.get(i).pos.y<0)
          {
            game_objects.get(i).alive=false; 
          }
          
          if(mode==1)
          {
            game_objects.get(2).alive=false;
            if(game_objects.get(1).alive==false)
            {
              gameState=3;
            }
          }
          
          if(mode==2 && game_objects.get(1).alive==false && game_objects.get(2).alive==false)
          {
            gameState=3;
          }
        //}
        game_objects.get(i).update();
        game_objects.get(i).display();
      }
      stroke(0);
      fill(255,0,0);
      textSize(20);
      if(mode==1)
      {
        fill(255,0,0);
        text("Player1= "+game_objects.get(1).score+" metres", width-250, height-50);
      }
      if(mode==2)
      {
        fill(255,0,0);
        text("Player1= "+game_objects.get(1).score+" metres", width-250, height-50);
        fill(0,0,255);
        text("Player2= "+game_objects.get(2).score+" metres", width-250, height-25);
      } 
    // End loop.
  }
  if(gameState==3)
  {
    if(mode==1)
    {
      String strscore = str(game_objects.get(1).score);
      String[] list = split(strscore, ' ');
      
      saveStrings("highScore.txt", list);
      
      String lines[] = loadStrings("highScore.txt");
      for (int i = 0 ; i < lines.length; i++) 
      {
        textSize(20);
        text("HighScores", 400, 300);
        text(lines[i], 400, 350);
      }
    }
    
    if(mode==2)
    {
      String strscore = str(game_objects.get(1).score);
      String strscore2 = str(game_objects.get(2).score);
      String[] list = split(strscore, ' ');
      String[] list2 = split(strscore2, ' ');
      
      saveStrings("highScore.txt", list);
      saveStrings("highScore.txt", list2);
      
      String lines[] = loadStrings("highScore.txt");
      for (int i = 0 ; i < lines.length; i++) 
      {
        textSize(20);
        text("HighScores", 500, 300);
        text(lines[i], 500, 350);
      }
    }
    fill(255);
    textSize(100);
    text("Game Over", 350, 200);
    textSize(50);
    text("Retry", 300, 500);
    if(mouseX>300 && mouseX<500 && mouseY>450 && mouseY<500)
    {
      textSize(20);
      text("Click to Go!", 300, 520);
      if(mousePressed==true)
      {
        gameState=1;
        game_objects.get(1).alive=true;
        game_objects.get(2).alive=true;
        game_objects.get(1).pos.y=height/2;
        game_objects.get(2).pos.y=height/2;
        game_objects.get(1).score=0;
        game_objects.get(2).score=0;
      }
    }
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

