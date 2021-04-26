Star[] finalFrontier= new Star[250];
Spaceship enterprise= new Spaceship();
//Asteroid asteroids = new Asteroid();
ArrayList <Asteroid> asteroids;
ArrayList <Bullet> shots;
Asteroid rock;
Bullet shot;
//ArrayList<Asteroid> arrayAst;
public void setup() 
{
  size (500, 500);
  //for (int i= 0; i< finalFrontier.length; i++) {
  //  finalFrontier[i]= new Star();
  //}
  //Asteroid asteroids = new Asteroid();
  asteroids = new ArrayList<Asteroid>();
  for ( int i = 0; i < 10; i++){
  rock = new Asteroid();
  asteroids.add(rock);
  }
  shots = new ArrayList<Bullet>();
}

public void draw() 
{
  background(0);
  //for (int i= 0; i< finalFrontier.length; i++) {
  //  finalFrontier[i].show();
  for (int i= 0; i< finalFrontier.length; i++) {
    finalFrontier[i]= new Star();
  }
  enterprise.show();
  enterprise.move();
  for ( int i = 0; i < asteroids.size(); i++) {
    asteroids.get(i).show();
    asteroids.get(i).move();
    float d = dist((float)enterprise.getX(), (float)enterprise.getY(), (float)asteroids.get(i).getX(), (float)asteroids.get(i).getY());
    if (d < 50)
      asteroids.remove(i);
  }
  for ( int i = 0; i < shots.size(); i++) {
    shots.get(i).move();
    shots.get(i).show();
  }
    text("myCenterX:"+ enterprise.myCenterX, 10, 10);
    text("myCenterY:"+ enterprise.myCenterY, 10, 20);
    text("myPointDirection:"+ enterprise.myPointDirection, 10, 30);
    text("myXSpeed:"+ enterprise.myXspeed, 10, 40);
    text("myYSpeed:"+ enterprise.myYspeed, 10, 50);
  
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
    enterprise.accelerate(0.05);
  }
  if (key == ' ') {
    shots.add(new Bullet(enterprise));
  }
}
