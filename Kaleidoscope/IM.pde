class IM {

  PImage rev(PImage img) {
    PGraphics g=createGraphics(img.width, img.height, JAVA2D);
    g.beginDraw();
    g.scale(-1, 1);
    g.image(img, -img.width, 0);
    g.scale(-1, 1);
    g.endDraw();
    return g;
  }

  PImage rot(PImage img, int deg) {
    PGraphics g=createGraphics(img.width, img.height, JAVA2D);
    g.beginDraw();
    g.translate(img.width/2.0, img.height/2.0);
    g.rotate(radians(2*deg));
    g.translate(-img.width/2.0, -img.height/2.0);
    g.image(img, 0, 0);
    g.translate(-img.width/2.0, -img.height/2.0);
    g.rotate(radians(-2*deg));
    g.translate(img.width/2.0, img.height/2.0);
    g.endDraw();
    return g;
  }
}