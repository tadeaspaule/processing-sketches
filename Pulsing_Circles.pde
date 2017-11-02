int counter = 0;
int spaces = 10;
boolean growing = true;
int r,g,b,r2,g2,b2,greater,smaller,maxcircles;

void setup(){
 fullScreen();
 background(0);
 noFill();
 frameRate(10);
 ellipseMode(CENTER);
 if(width>height){greater=width;smaller=height;}else{greater=height;smaller=width;}
 maxcircles = smaller/20;
 r=(int)random(256);g=(int)random(256);b=(int)random(256);r2=(int)random(256);g2=(int)random(256);b2=(int)random(256);
}

void draw(){
background(0); 
stroke(r,g,b);
for (int i = 0; i < counter; i++){ellipse(width/2,height/2,spaces*2*(i+1),spaces*2*(i+1));}
 stroke(r2,g2,b2);
 for (int i = 0; i < counter; i++){ellipse(width/2,height/2,smaller-5-(spaces*2*(i+1)),smaller-5-(spaces*2*(i+1)));}
 if(growing){counter++;}else{counter--;}
  if (counter>maxcircles){growing=false;r=(int)random(256);g=(int)random(256);b=(int)random(256);r2=(int)random(256);g2=(int)random(256);b2=(int)random(256);}
  if(counter<0){growing=true;r=(int)random(256);g=(int)random(256);b=(int)random(256);r2=(int)random(256);g2=(int)random(256);b2=(int)random(256);}
}