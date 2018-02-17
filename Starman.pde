float x,y,vx,vy;
PImage roadfromleft,roadfromright,bg;
boolean fromleft = true;

void setup(){
 fullScreen();
 imageMode(CENTER);
 frameRate(30);
 resetcar();
 roadfromleft = loadImage("roadfromleft.png");
 roadfromright = loadImage("roadfromright.png");
 bg = loadImage("bg.png");
}

void draw(){
 background(0);
 if (height>width){
  image(bg,width/2,height/2,2070*height/2070,height); 
 }
 else{
  image(bg,width/2,height/2,width,2070*width/2070); 
 }
 
 x+=2*vx;
 y+=2*vy;
 if ((fromleft==true && x>width+70*displayDensity) | (fromleft==false && x<-70*displayDensity) | y<-70*displayDensity | y>height+70*displayDensity){
  resetcar();
 }
 

 translate(x,y);
 rotate(atan(vy/vx));
 
 if (fromleft){image(roadfromleft,0,0,120*displayDensity,48*displayDensity);}
 else {image(roadfromright,0,0,120*displayDensity,48*displayDensity);}
 
}

void resetcar(){
 if ((int)random(2)==0){
   fromleft = true;
   x = -50*displayDensity;
   y = random(height);
   vx = random(3)+3;
   vy = random(8)-4;  
 }
 else{
   fromleft = false;
   x = width+50*displayDensity;
   y = random(height);
   vx = -(random(3)+3);
   vy = random(8)-4; 
 }
}