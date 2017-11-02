int greater, radius,x,y,x2,y2;
int numofsquares = 10;
int counter = 0;

void setup(){
  fullScreen();
  background(0);
  frameRate(20);
  noFill();
  stroke(0);
  if (width>height){greater = width;}
  else {greater = height;}
  radius = (int)(greater*0.3);
}

void draw(){
 background(0);
 stroke(255);
 for (int i = 1; i <= numofsquares; i++){ 
 for (int d=-counter;d>-360-counter;d-=90){
   x=(int)(width/2 + (radius- (radius/numofsquares)*i)*cos(radians(d)));
   y=(int)(height/2 + (radius- (radius/numofsquares)*i)*sin(radians(d)));
   x2=(int)(width/2 + (radius- (radius/numofsquares)*i)*cos(radians(d+90)));
   y2=(int)(height/2 + (radius- (radius/numofsquares)*i)*sin(radians(d+90)));
   line(x,y,x2,y2);
 }
 }
 counter++;
 if (counter==360){counter=0;}
}