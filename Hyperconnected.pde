Node[] nodes = new Node[15];
float planetrad;
PImage earth;

void setup(){
  background(200);
  fullScreen();
  if (height > width){
   planetrad = 0.4*width; 
  }
  else{
   planetrad = 0.4*height; 
  }
  frameRate(30);
  ellipseMode(CENTER);
  imageMode(CENTER);
  stroke(255,255,255,120);
  strokeWeight(2);
  fill(100);
  for (int i = 0; i < 15; i++){
   nodes[i] = new Node(); 
  }
  
  earth = loadImage("bwe.png");
}

void draw(){
  background(200);
  image(earth,width/2,height/2,planetrad*2,planetrad*2);
  for (int i = 0; i < 15; i++){
    for (int deg = 0; deg < 360; deg += 20){
      float dx = width/2 + planetrad*cos(radians(deg));
      float dy = height/2 - planetrad*sin(radians(deg));
      line(nodes[i].x,nodes[i].y,dx,dy);
      line(dx,dy,width/2+planetrad*cos(radians(deg+20)),height/2-planetrad*sin(radians(deg+20)));
    }
    nodes[i].move();
  }
  
}


class Node{
  float x;
  float y;
  float xtarget;
  float ytarget;
  float xstep;
  float ystep;
  
  static final float movestep = 6;
  
  public Node(){
    this.x = random(width);
    this.y = random(height);
    while (planetrad*planetrad < pow(this.x-width/2,2)+pow(this.y-height/2,2)){
      this.x = random(width);
      this.y = random(height);
    }
    this.setstepstargets();
  }
  
  public void setstepstargets(){
    this.xtarget = random(width);
    this.ytarget = random(height);
    while (planetrad*planetrad < pow(this.xtarget-width/2,2)+pow(this.ytarget-height/2,2)){
      this.xtarget = random(width);
      this.ytarget = random(height);
    }
    float dist = sqrt(pow(x-xtarget,2)+pow(y-ytarget,2));
    this.xstep = ((this.xtarget-this.x)*movestep)/dist;
    this.ystep = ((this.ytarget-this.y)*movestep)/dist;
    
  }
  
  public void move(){
    this.x += this.xstep;
    this.y += this.ystep;
    if (abs(this.x-this.xtarget) < 5 || abs(this.y-this.ytarget) < 5){
      setstepstargets();
    }
  }
}
