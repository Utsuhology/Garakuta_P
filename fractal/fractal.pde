PFont font;
float gLen;
int step=0;
int count=0;

void setup() {
  size(500, 500);
  gLen=width;
}

void draw() {
  background(255);

  stroke(0);
  strokeWeight(1);
  noFill();

  stroke(0, 20);
  strokeWeight(10);
  fill(255, 0, 0, 20);
  slashF(width/2.0, height/2.0, gLen, 0, step);
}

void mousePressed() {
  save(count+".jpg");
  count++;
}

void keyPressed() {
  step++;
}
