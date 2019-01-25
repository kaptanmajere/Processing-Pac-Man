int movx, movy, posy, posx;
float doty, dotx;
int i;
float distX;
float distY;
float distance;
float posRad=50;
float dotRad=10;
float distance_dots;

void setup() {

  size(1000, 500);
  movx=0;
  movy=0;
  dotx=random(width);
  doty=random(height);
  posx=0;
  posy=0;
}

void draw() {
  posx=width/2+movy;
  posy=height/2+movx;
  background(255, 255, 255);

  ellipse(dotx, doty, 5, 5);

  fill(255, 255, 0);
  stroke(0, 0, 0);
  strokeWeight(3);


distX=abs(posx-dotx); //<>//
distY=abs(posy-doty);
distance_dots=sqrt((distX*distX)+(distY*distY));
distance=distance_dots-30;



if(distance>=0){
  ellipseMode(RADIUS);
  ellipse(posx, posy, 25, 25);
}
  
  else {
    dotx=random(width/2);
    doty=random(height/2);
    background(255, 255, 255);
    
    ellipseMode(RADIUS);
    ellipse(posy, posx, 25, 25);
    ellipseMode(CENTER);
    ellipse(dotx, doty, 5, 5);


  }


  if (keyCode==UP) {
    movx+=-5;
  }
  if (keyCode==DOWN) {
    movx+=5;
  }
  if (keyCode==RIGHT) {
    movy+=5;
  }

  if (keyCode==LEFT) {
    movy+=-5;
  }

  if (key==ENTER) {
    frameCount=-1;
  }
}
