class Background extends GameObject
{

  float[] landHeights = new float[0];
  float landSegmentWidth = 10;
  float currentHeight = 800;

  Background()
  {
  }

  void update()
  {
    if (landHeights.length>0) {
      landHeights = subset(landHeights, 1);
    }
    while (landHeights.length < width / landSegmentWidth) {
      landHeights = append(landHeights, currentHeight);
      currentHeight += random(-5, 5);
      if (currentHeight > height) {
        currentHeight = height;
      } else if (currentHeight < 300) {
        currentHeight = 300;
      }
    }
  }

  void display()
  {
    stroke(255);
    fill(255); 
    for (int i = 0; i< landHeights.length; i++) {
      rect(i*landSegmentWidth, 0, landSegmentWidth, height-landHeights[i]);
      rect(i*landSegmentWidth, landHeights[i], landSegmentWidth, height);
    }
  }
}

