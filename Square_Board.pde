int sidey, sidex, x, y, r, g, b, posindex, places;
ArrayList<Integer> openpos = new ArrayList<Integer>();
void setup() {
  fullScreen();
  background(0);
  rectMode(CORNERS);
  frameRate(5);
  sidey = height/10;
  sidex = width / (round(width/sidey));
  places = (width/sidex)*(height/sidey);
  r = (int)random(256); 
  g = (int)random(256); 
  b = (int)random(256);
  fill(r, g, b);
  for (int i = 0; i<places; i++) {
    openpos.add(i);
  }
}



void draw() {    
  if (openpos.size()==0) {
    r = (int)random(256); 
    g = (int)random(256); 
    b = (int)random(256);
    for (int i = 0; i<places; i++) {
      openpos.add(i);
    }
    fill(r, g, b);
  }
  posindex = (int)random(openpos.size());
  y = (int)openpos.get(posindex)/(width/sidex);
  x = openpos.get(posindex) - y*(width/sidex);

  openpos.remove(posindex);
  rect(x*sidex, y*sidey, (x+1)*sidex, (y+1)*sidey);
}