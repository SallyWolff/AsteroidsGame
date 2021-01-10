Star[] finalFrontier= new Star[250];
Spaceship enterprise= new Spaceship();
public void setup() 
{
  size (500, 500);
  for (int i= 0; i< finalFrontier.length; i++) {
    finalFrontier[i]= new Star();
  }
}
public void draw() 
{
  background(0);
  for (int i= 0; i< finalFrontier.length; i++) {
    finalFrontier[i].show();
    enterprise.show();
    enterprise.move();
  }
}
void keyPressed() {
  if (key =='s') {
    enterprise.hyperspace();
  }
  if (key == 'a') {
    enterprise.turn(-10);
  }
  if (key == 'd') {
    enterprise.turn(10);
  }
  if (key == 'w') {
    enterprise.accelerate(0.005);
  }
}

//This is the floater class new tab

class Floater //Do NOT modify the Floater class! Make changes in the Spaceship class 
{   
  protected int corners;  //the number of corners, a triangular floater has 3   
  protected int[] xCorners;   
  protected int[] yCorners;   
  protected int myColor;   
  protected double myCenterX, myCenterY; //holds center coordinates   
  protected double myXspeed, myYspeed; //holds the speed of travel in the x and y directions   
  protected double myPointDirection; //holds current direction the ship is pointing in degrees    

  //Accelerates the floater in the direction it is pointing (myPointDirection)   
  public void accelerate (double dAmount)   
  {          
    //convert the current direction the floater is pointing to radians    
    double dRadians =myPointDirection*(Math.PI/180);     
    //change coordinates of direction of travel    
    myXspeed += ((dAmount) * Math.cos(dRadians));    
    myYspeed += ((dAmount) * Math.sin(dRadians));       
  }   
  public void turn (double degreesOfRotation)   
  {     
    //rotates the floater by a given number of degrees    
    myPointDirection+=degreesOfRotation;   
  }   
  public void move ()   //move the floater in the current direction of travel
  {      
    //change the x and y coordinates by myXspeed and myYspeed       
    myCenterX += myXspeed;    
    myCenterY += myYspeed;     

    //wrap around screen    
    if(myCenterX >width)
    {     
      myCenterX = 0;    
    }    
    else if (myCenterX<0)
    {     
      myCenterX = width;    
    }    
    if(myCenterY >height)
    {    
      myCenterY = 0;    
    } 
    
    else if (myCenterY < 0)
    {     
      myCenterY = height;    
    }   
  }   
  public void show ()  //Draws the floater at the current position  
  {             
    fill(myColor);   
    stroke(myColor);    
    
    //translate the (x,y) center of the ship to the correct position
    translate((float)myCenterX, (float)myCenterY);

    //convert degrees to radians for rotate()     
    float dRadians = (float)(myPointDirection*(Math.PI/180));
    
    //rotate so that the polygon will be drawn in the correct direction
    rotate(dRadians);
    
    //draw the polygon
    beginShape();
    for (int nI = 0; nI < corners; nI++)
    {
      vertex(xCorners[nI], yCorners[nI]);
    }
    endShape(CLOSE);

    //"unrotate" and "untranslate" in reverse order
    rotate(-1*dRadians);
    translate(-1*(float)myCenterX, -1*(float)myCenterY);
  }   
} 

// This is spaceship new tab

class Spaceship extends Floater  
{   
  public Spaceship(){
    corners= 4;
    xCorners= new int[]{-8, 16, -8, -2};
    yCorners= new int[]{-8, 0, 8, 0};
    myColor= color(255, 255, 255);
    myCenterX= 250;
    myCenterY= 250;
    myXspeed= 0;
    myYspeed= 0;
    myPointDirection= 0;
  }
  public void hyperspace(){
    myXspeed= 0;
    myYspeed= 0;
    myCenterX= (int)(Math.random()*width);
    myCenterY= (int)(Math.random()*height);
  }
}

// this is star new tab

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
