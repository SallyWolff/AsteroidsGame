class Star
{
  private int myX, myY, colorSet;
  public Star() {
    myX= (int)(Math.random()*500);
    myY= (int)(Math.random()*500);
    colorSet= (255);
  }
  public void show() {
    fill(0,10);
    rect(0,0,width,height);
    fill(colorSet);
    ellipse(myX, myY, 3, 3);
  }
}
