KaleidoDrawer kd;
int deg;
PImage genga, ga;

void setup() {
  size(280, 280, FX2D);

  genga=loadImage("ututu1.jpg");

  int w, h;
  w=genga.width;
  h=genga.height;

  if (w<h) {
    ga=genga.get(0, (h-w)/2, w, w);
  } else {
    ga=genga.get((w-h)/2, 0, h, h);
  }
  ga.resize(50, 50);

  deg=0;
  kd=new KaleidoDrawer(ga);
}

void draw() {
  background(0);

  /*noStroke();
   fill(#ECFF5D, 100);
   ellipse(mouseX, mouseY, 15, 15);
   fill(#ECFF5D, 20);
   ellipse(mouseX, mouseY, 35, 35);*/

  //if (mousePressed) {
  deg+=4;
  //}
  //kd.setGenga(ga);
  kd.setDeg(deg);

  kd.draw();
}