int counter = 0;
int space = 10;
boolean fromright = true;

void setup(){
  //size(500,800);
  fullScreen();
  background(0);
  stroke(random(256),random(256),random(256));
  noFill();
  ellipseMode(CENTER);
  frameRate(20);
}

void draw(){
 if (fromright){
   line(0+counter*space,height,0,height-counter*space);
   counter++; 
   if (counter*space>height+width){
     stroke(random(256),random(256),random(256));
     counter=0;
     fromright = false;
 }
 }
 else{
   line(width-counter*space,height,width,height-counter*space);
   counter++; 
   if (counter*space>height+width){
     stroke(random(256),random(256),random(256));
     counter=0;
     fromright = true;
 }
 } 
 }