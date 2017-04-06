PImage pFrame;

void setup() {
  size(400, 400);

  background(0);
  pFrame=get(0, 0, width, height);
}

void draw() {
  imageMode(CORNER);
  image(pFrame, 0, 0);

  float l=dist(mouseX, mouseY, width/2.0, height/2.0), theta=atan2(mouseY-height/2.0, mouseX-width/2.0);
  float pl=dist(pmouseX, pmouseY, width/2.0, height/2.0), ptheta=atan2(pmouseY-height/2.0, pmouseX-width/2.0);

  if (mousePressed) {
    stroke(-1);
    strokeWeight(2);
    for (int i=0; i<12; i++) {
      line(width/2.0+l*cos(theta+radians(i*30)), height/2.0+l*sin(theta+radians(i*30)), width/2.0+pl*cos(ptheta+radians(i*30)), height/2.0+pl*sin(ptheta+radians(i*30)));
      line(width/2.0+l*cos(-(theta+radians(i*30))), height/2.0+l*sin(-(theta+radians(i*30))), width/2.0+pl*cos(-(ptheta+radians(i*30))), height/2.0+pl*sin(-(ptheta+radians(i*30))));
    }
  }

  pFrame=get(0, 0, width, height);
}