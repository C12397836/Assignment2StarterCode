class Background extends GameObject
{

  float[] caveHeights = new float[0];
  float segmentWidth = 1;
  float currentHeight =800;

  Background()
  {
  }

  void update()
  {
    if (caveHeights.length>0) 
    {
      caveHeights = subset(caveHeights, 5);
    }
    while (caveHeights.length < width/segmentWidth) 
    {
      caveHeights = append(caveHeights, currentHeight);
      currentHeight += random(-5, 5);
      if (currentHeight > height) 
      {
        currentHeight = height;
      } 
      else if (currentHeight < (height/2)+20) 
      {
        currentHeight = (height/2)+20;
      }
    }
  }

  void display()
  {
    stroke(#646464);
    fill(#646464); 
    for (int i = 0; i< caveHeights.length; i++) 
    {
      rect(i*segmentWidth, 0, segmentWidth, height-caveHeights[i]);
      rect(i*segmentWidth, caveHeights[i], segmentWidth, height);
    }
    /*for(int i=0; i<caveHeights.length; i++)
    { 
      caveHeights[i]=currentHeight+(int)random(-5,5);
      currentHeight=caveHeights[i];
      rect(i*segmentWidth, height, segmentWidth, caveHeights[i]);
    }
    for(int i=0; i<caveHeights.size(); i++)
    {
      caveHeights.add(int[currentHeight+random(-5,5)]);
      caveHeights.remove(currentHeight-width);
    }*/
  }
}

