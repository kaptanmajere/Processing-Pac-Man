import processing.sound.*; //<>// //<>//
SoundFile file;
PImage img;
int movx, movy, posy, posx;
float doty, dotx;
int i;
float distX;
float distY;
float distance;
float distance_dots;
int k=0;
int s=0;
int m=0;
int n=0;
float redx, redy, greenx, greeny, distredy, distredx, distance_red, distanceR, distance_green, distgreenx, distgreeny, distanceG;
int life=1;
int tempend=0;
int redrand;
int tempmovx=width/2;
int tempmovy;
SoundFile music;
SoundFile song;
void setup() {
  size(1000, 500);
  //fullScreen();
  movx=0;
  movy=0;

  img = loadImage ("heart.png");

  dotx=random(width);
  doty=random(height);

  greenx=random(width);
  greeny=random(height);

  redx=random(width);
  redy=random(height);

  posx=0;
  posy=0;
  music= new SoundFile(this, "mega.mp3");
  music.loop(1, 0.0);
}

void draw() {
  background(255, 255, 255);




  posx=tempmovx+movx;
  posy=height/2+movy;

  imageMode(CENTER);
  image(img, 30, 30, height/20, width/18);

  if (millis()/1000>10) {
    redrand=int (random(0, 60));
    if (redrand==3) {
      redx=random(width);
      redy=random(height);
      fill(255, 0, 0);
      ellipse(redx, redy, 5, 5);
    }
  }
  fill(0, 0, 255);
  ellipse(dotx, doty, 5, 5);

  fill(255, 0, 0);
  ellipse(redx, redy, 5, 5);

  fill(0, 255, 0);
  ellipse(greenx, greeny, 5, 5);

  /*if (posx>width) {
   posx=30;
   }
   if (posx<0) {
   posx=width-30;
   }
   
   if (posy>height) {
   posy=30;
   }
   if (posy<0) {
   posy=height-30;
   }
   */


  fill(0, 0, 0);
  textSize(20);
  s=(millis()/1000)%60;
  text(s, width-20, height-20);

  m=millis()/60000;


  text(':', width-37, height-20);
  text(m, width-50, height-20);

  text(life, 30, 30);

  fill(255, 255, 0);
  stroke(0, 0, 0);
  strokeWeight(3);


  distredx=abs(posx-redx);
  distredy=abs(posy-redy);
  distance_red=sqrt((distredx*distredx)+(distredy*distredy));
  distanceR=distance_red-30;


  distgreenx=abs(posx-greenx);
  distgreeny=abs(posy-greeny);
  distance_green=sqrt((distgreenx*distgreenx)+(distgreeny*distgreeny));
  distanceG=distance_green-30;


  distX=abs(posx-dotx);
  distY=abs(posy-doty);
  distance_dots=sqrt((distX*distX)+(distY*distY));
  distance=distance_dots-30;



  if (distanceG>=0) {

    ellipseMode(RADIUS);
    ellipse(posx, posy, 25, 25);
    fill(0, 0, 0);
    textAlign(CENTER);
    textSize(200);
    text(0+k, width/2, height/2);
    textSize(190);
    fill(200, 20, 20);

    text(0+k, width/2, height/2);
    fill(255, 255, 0);
  } else {
    background(255, 255, 255);
    fill(255, 255, 0);
    greenx=random(width);
    greeny=random(height);
    life++;

    file= new SoundFile(this, "lifeup.mp3");
    file.play();
  }

  if (distanceR>=0) {

    ellipseMode(RADIUS);
    ellipse(posx, posy, 25, 25);
    fill(0, 0, 0);
    textAlign(CENTER);
    textSize(200);
    text(0+k, width/2, height/2);
    textSize(190);
    fill(200, 20, 20);

    text(0+k, width/2, height/2);
    fill(255, 255, 0);
  } else {
    background(255, 255, 255);
    fill(255, 255, 0);
    redx=random(width);
    redy=random(height);
    life--;
    file = new SoundFile(this, "lifedown.wav");
    file.play();
  }

  if (distance>=0) {
    ellipseMode(RADIUS);
    ellipse(posx, posy, 25, 25);
    fill(0, 0, 0);
    textAlign(CENTER);
    textSize(200);
    text(0+k, width/2, height/2);
    textSize(190);
    fill(200, 20, 20);

    text(0+k, width/2, height/2);

    fill(255, 255, 0);
  } else {
    background(255, 255, 255);
    fill(255, 255, 0);
    dotx=random(width);
    doty=random(height);

    file=new SoundFile(this, "ping.mp3");
    file.play();
    ellipseMode(CENTER);
    fill(0, 0, 255);

    ellipse(dotx, doty, 10, 10);
    textSize(200);
    fill(0, 0, 0);
    textAlign(CENTER);
    text(0+k, width/2, height/2);
    fill(255, 255, 0);
    k++;
  }


  if (life==0) {
    background(0, 0, 0);
    textAlign(CENTER);
    textSize(100);
    text("GAMEOVER", width/2, height/2);
    music.stop();
    tempend++;
    if (tempend==1) {
      song =new SoundFile(this, "madworld.mp3");
      song.play();
    }
  }






  if (keyCode==UP) {
    movy+=-5;
  }
  if (keyCode==DOWN) {
    movy+=5;
  }
  if (keyCode==RIGHT) {
    movx+=5;
  }

  if (keyCode==LEFT) {
    movx+=-5;
  }
}
