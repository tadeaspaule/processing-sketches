int r,g,b,r2,g2,b2,deg,rad,elisize,c;
float x,y,x2,y2;

void setup(){
 //fullScreen();
 size(1280,720);
 frameRate(100);
 ellipseMode(CENTER);
 noStroke();
 background(255);
 c = 0;
 r = (int)random(256);
 g = (int)random(256);
 b = (int)random(256);
 r2 = (int)random(256);
 g2 = (int)random(256);
 b2 = (int)random(256);
 deg = 0;
 if (height<width){rad = height/4; elisize = height/5;}
 else {rad = width/4; elisize = width/5;}
}

void draw(){
 fill(r,g,b);
 x = (width/2+rad*cos(radians(deg)));
 y = (height/2 - rad*sin(radians(deg)));
 x2 = (width/2+rad*cos(radians(deg+180)));
 y2 = (height/2 - rad*sin(radians(deg+180)));
 ellipse(x,y,elisize,elisize);
 fill(255-r,255-g,255-b);
 ellipse(x2,y2,elisize,elisize);
 deg+=2;
 if (deg==360){deg = 0;}
 changefill();
 c++;
 if (c%180==0){
  saveFrame("1280-"+String.valueOf((int)c/180)+".png"); 
 }
}

void changefill(){
  if (r > r2){r-=1;}
  else if(r<r2){r+=1;}
  else{r2 = (int)random(256);}
  if (g > g2){g-=1;}
  else if(g<g2){g+=1;}
  else{g2 = (int)random(256);}
  if (b > b2){b-=1;}
  else if(b<b2){b+=1;}
  else{b2 = (int)random(256);}
  fill(r,g,b);
}