import java.util.Date;

PImage img;

int lower,AU,sundiameter,earthd,startseconds,counter,seconds;
int marsmargin=25;
String stime;

//0 is currentx,1 is currenty, 2 is degrees
float[] mars = new float[3];
float[] earth = new float[3];
float[] venus = new float[3];
float[] mercury = new float[3];


void setup(){
  size(450,800);
 //fullScreen();
 background(0);
 frameRate(24);
 ellipseMode(CENTER);
 imageMode(CENTER);
 
 img = loadImage("earthpic.png");
 
 if(width>height){lower=height;}else{lower=width;}
 sundiameter=(int)(lower/7.5);
 earthd=(int)(sundiameter/2.2);
 AU = (int)((lower/2-(earthd*0.533)/2-lower/30)/1.52);
 
 seconds = Integer.parseInt(String.format("%tr",new Date()).substring(6,8));
 
 
 earth[2]=seconds*6+270;
 mars[2]=earth[2]+255;
 venus[2]=earth[2]+190;
 mercury[2]=earth[2]+340;
 setPlanetXY();
 stime=null;
}

void draw(){
 drawBase();
  
 fill(247,136,80);
 ellipse(mars[0],mars[1],earthd*0.533,earthd*0.533);//mars
  
 //fill(113,148,203); original earth color
 image(img,earth[0],earth[1],earthd,earthd);
 
 fill(224,212,197);
 ellipse(venus[0],venus[1],earthd*0.95,earthd*0.95);//venus
 
 fill(186,172,163);
 ellipse(mercury[0],mercury[1],earthd*0.383,earthd*0.383);//mercury
 
  counter++;
  if (counter==24){
  seconds = Integer.parseInt(String.format("%tr",new Date()).substring(6,8));
  earth[2]=seconds*6+270; counter=0;
}//resets earth 
  else {earth[2]+=0.25;}
  mars[2]+=0.132923;  //0.25*0.53169
  venus[2]+=0.406423; //0.25*1.62569
  mercury[2]+=1.038143;  //0.25*4.15257
  setPlanetXY();
  
}

void drawBase(){
  background(0);
  fill(220,220,0);//setting to sun color
  ellipse(width/2,height/2,sundiameter,sundiameter);
  noFill();
  stroke(70);
  ellipse(width/2,height/2,AU*3.048,AU*3.048);//mars line
  ellipse(width/2,height/2,AU*2,AU*2); //earth line
  ellipse(width/2,height/2,AU*1.446,AU*1.446); //venus line
  ellipse(width/2,height/2,AU*0.78,AU*0.78); //mercury line
}

void setPlanetXY(){
 if(mars[2]>=360){mars[2]-=360;}
 if(earth[2]>=360){earth[2]-=360;}
 if(venus[2]>=360){venus[2]-=360;}
 if(mercury[2]>=360){mercury[2]-=360;}
 mars[0]=(int)(width/2+AU*1.524*cos(radians(mars[2])));
 earth[0]=(int)(width/2+AU*cos(radians(earth[2])));
 venus[0]=(int)(width/2+AU*0.723*cos(radians(venus[2])));
 mercury[0]=(int)(width/2+AU*0.39*cos(radians(mercury[2])));
 mars[1]=(int)(height/2+AU*1.524*sin(radians(mars[2])));
 earth[1]=(int)(height/2+AU*sin(radians(earth[2])));
 venus[1]=(int)(height/2+AU*0.723*sin(radians(venus[2])));
 mercury[1]=(int)(height/2+AU*0.39*sin(radians(mercury[2])));
}