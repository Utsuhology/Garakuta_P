void setup() {
  size(500, 500);
}

void draw() {
  background(100);

  PFont font=createFont("MS-Gothic", 16, true);

  stroke(-1);
  strokeWeight(1);
  line(0, 250, width, 250);

  fill(-1);
  textAlign(CENTER);
  textFont(font);
  textSize(30);
  textIy("鮫SAMEsame", 250, 250);
}