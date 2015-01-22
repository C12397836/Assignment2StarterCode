class Background extends GameObject
{

  float[] caveHeights = new float[0];
  float segmentWidth = 1;
  float currentHeight = 1000;

  Background()
  {
  }

  void update()
  {
    if (caveHeights.length>0) 
    {
      caveHeights = subset(caveHeights, 5);
    }
    while (caveHeights.length < width / segmentWidth) 
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
      println(currentHeight);
    }
  }

  void display()
  {
    stroke(255);
    fill(255); 
    for (int i = 0; i< caveHeights.length; i++) 
    {
      rect(i*segmentWidth, 0, segmentWidth, height-caveHeights[i]);
      rect(i*segmentWidth, caveHeights[i], segmentWidth, height);
    }
  }
}

