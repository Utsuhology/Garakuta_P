color[][] buffPixels;
int widthOfBuffPixels, heightOfBuffPixels;

void setup() {
  size(600, 600);

  PImage img=loadImage("ひと.png");
  widthOfBuffPixels=img.width;
  heightOfBuffPixels=img.height;

  changeWindowSize(widthOfBuffPixels, heightOfBuffPixels);

  img.loadPixels();
  buffPixels=new color[widthOfBuffPixels][heightOfBuffPixels];
  for (int iy=0; iy<heightOfBuffPixels; iy++) {
    for (int ix=0; ix<widthOfBuffPixels; ix++) {
      buffPixels[ix][iy]=img.pixels[iy*widthOfBuffPixels+ix];
    }
  }
}

void draw() {
  background(-1);
  noStroke();
  for (int iy=0; iy<heightOfBuffPixels; iy++) {
    for (int ix=0; ix<widthOfBuffPixels; ix++) {
      fill(buffPixels[ix][iy]);
      rect(ix, iy, 1, 1);
    }
  }
}

void mousePressed() {
  println(buffPixels[mouseX][mouseY]);
  if (mouseButton==LEFT) {
    floodfill(mouseX, mouseY, 255, 0, 0);
  } else {
    floodfill(mouseX, mouseY, 0, 0, 255);
  }
}