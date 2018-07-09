Ball[] balls = new Ball[30];

void setup(){
 fullScreen();
 background(255);
 frameRate(30);
 ellipseMode(CENTER);
 noStroke();
 for (int i = 0; i < 30; i++){
  balls[i] = new Ball(); 
 }
}

void draw(){
 background(255);
 for (int i = 0; i < 30; i++){
  fill(balls[i].r,balls[i].g,balls[i].b,180-balls[i].perc*180);
  ellipse(balls[i].x,balls[i].y,displayDensity*balls[i].maxdiam*balls[i].perc,displayDensity*balls[i].maxdiam*balls[i].perc);
  balls[i].update();
 }
}

class Ball{
  float x;
  float y;
  float maxdiam;
  float perc;
  float r,g,b;
  
  public Ball(){
   this.r = random(256);
   this.g = random(256);
   this.b = random(256);
   this.x = random(width);
   this.y = random(height);
   this.maxdiam = 25 + random(150);
   this.perc = random(1);
  }
  
  public void update(){
    this.perc+=0.004;
    if (this.perc >= 1){
      this.r = random(256);
      this.g = random(256);
      this.b = random(256);
      this.x = random(width);
      this.y = random(height);
      this.maxdiam = 25 + random(150);
      this.perc = 0;
    }
  }
}
