ArrayList listx=new ArrayList();
ArrayList listy=new ArrayList();

void setup() {
  size(500, 500);
  frameRate(-1);
}

int t=0;
float rangeMarge;

void draw() {
  background(0);

  t++;
  rangeMarge=100+(100*sin(radians(t)));
  float px=random(rangeMarge, width-rangeMarge);
  listx.add(px);
  float py=random(rangeMarge, height-rangeMarge);
  listy.add(py);
  if (listx.size()>100) {
    listx.remove(0);
  }
  if (listy.size()>100) {
    listy.remove(0);
  }

  noStroke();
  fill(240-rangeMarge, 90);
  beginShape();
  for (int RP=0; RP<listx.size(); RP++) {
    vertex((float)listx.get(RP), (float)listy.get(RP));
  }
  endShape(CLOSE);
}