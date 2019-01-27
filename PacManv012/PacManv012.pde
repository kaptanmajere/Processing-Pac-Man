import processing.sound.*; //<>//
SoundFile file;
int movx, movy, posy, posx;
float doty, dotx;
int i;
float distX;
float distY;
float distance;
float posRad=50;
float dotRad=10;
float distance_dots;
PImage pac;

void setup() {
  //size(1000, 500);
  fullScreen();
  movx=0;
  movy=0;
  dotx=random(width);
  doty=random(height);
  posx=0;
  posy=0;
  pac= loadImage("pac.png");
}

void draw() {
  posx=width/2+movy;
  posy=height/2+movx;
  background(255, 255, 255);

  ellipse(dotx, doty, 10, 10);

  fill(255, 255, 0);
  stroke(0, 0, 0);
  strokeWeight(3);


  distX=abs(posx-dotx);
  distY=abs(posy-doty);
  distance_dots=sqrt((distX*distX)+(distY*distY));
  distance=distance_dots-30;



  if (distance>=0) {
    image(pac, posx, posy, 50, 50);
  } else {
    dotx=random(width/2);
    doty=random(height/2);
    background(255, 255, 255);
    file=new SoundFile(this, "ping.mp3");
    file.play();
    image(pac, posy, posx, 50, 50);
    ellipseMode(CENTER);
    ellipse(dotx, doty, 10, 10);
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
    frameCount=0;
  }
  
}
