class TriCutter { 
  PImage img;
  PImage ga;
  int deg;
  boolean isRev;

  TriCutter(PImage genga) {
    this.setGenga(genga);

    deg=0;
    isRev=false;

    this.step();
  }

  void setGenga(PImage genga) {
    int w, h;
    w=genga.width;
    h=genga.height;

    if (w<h) {
      ga=genga.get(0, (h-w)/2, w, w);
    } else {
      ga=genga.get((w-h)/2, 0, h, h);
    }
    this.step();
  }

  void setDeg(int _deg) {
    deg=_deg;
    this.step();
  }

  void rev() {
    isRev=!isRev;
    this.step();
  }

  PImage publish() {
    return img;
  }

  //------------inner--------------

  void step() {
    PGraphics g=createGraphics(ga.width, ga.height, JAVA2D);
    PGraphics mask=createGraphics(ga.width, ga.height, JAVA2D);

    g.beginDraw();
    g.image(ga, 0, 0);

    mask.beginDraw();
    mask.noStroke();
    mask.fill(-1);
    mask.beginShape();
    float r=ga.width/2.0;
    for (int RP=0; RP<3; RP++) {
      mask.vertex(r+r*cos(radians(RP*120-90+deg)), r+r*sin(radians(RP*120-90+deg)));
    }
    mask.endShape(CLOSE);
    mask.endDraw();

    g.mask(mask);

    /*g.fill(0);
     g.ellipse(r+r*cos(radians(-90+deg)), r+r*sin(radians(-90+deg)), 10, 10);*/

    g.noFill();
    g.stroke(0, 100);
    g.strokeWeight(2);
    g.beginShape();
    for (int RP=0; RP<3; RP++) {
      g.vertex(r+r*cos(radians(RP*120-90+deg)), r+r*sin(radians(RP*120-90+deg)));
    }
    g.endShape(CLOSE);

    g.endDraw();


    if (isRev) {
      PGraphics g2=createGraphics(ga.width, ga.height, JAVA2D);
      g2.beginDraw();
      g2.scale(-1, 1);
      g2.image(g, -g.width, 0);
      g2.scale(-1, 1);
      g2.endDraw();

      PGraphics g3=createGraphics(ga.width, ga.height, JAVA2D);
      g3.beginDraw();
      g3.translate(ga.width/2.0, ga.height/2.0);
      g3.rotate(radians(2*deg));
      g3.translate(-ga.width/2.0, -ga.height/2.0);
      g3.image(g2, 0, 0);
      g3.translate(-ga.width/2.0, -ga.height/2.0);
      g3.rotate(radians(-2*deg));
      g3.translate(ga.width/2.0, ga.height/2.0);
      g3.endDraw();

      img=g3;
    } else {
      img=g;
    }
  }
}