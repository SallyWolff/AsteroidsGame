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
    text("myCenterX:"+ enterprise.myCenterX, 10, 10);
    text("myCenterY:"+ enterprise.myCenterY, 10, 20);
    text("myPointDirection:"+ enterprise.myPointDirection, 10, 30);
    text("myXSpeed:"+ enterprise.myXspeed, 10, 40);
    text("myYSpeed:"+ enterprise.myYspeed, 10, 50);
    text("myAwesomeness:100%", 10, 60);
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
