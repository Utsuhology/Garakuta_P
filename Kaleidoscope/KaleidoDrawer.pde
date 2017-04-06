class KaleidoDrawer {

  IM im;

  int DIMENSION=4;

  PImage centerImg[]=new PImage[DIMENSION];
  PImage runImg[]=new PImage[DIMENSION];
  PGraphics g[]=new PGraphics[DIMENSION];

  PImage genga;
  TriCutter trc;
  int deg=0;


  KaleidoDrawer(PImage _genga) {
    im=new IM();

    genga=_genga;
    trc=new TriCutter(genga);

    for (int RP=0; RP<DIMENSION; RP++) {
      centerImg[RP]=trc.publish();
      runImg[RP]=centerImg[RP];
    }
  }

  void draw() {
    centerImg[0]=trc.publish();

    for (int RP=0; RP<DIMENSION; RP++) {
      g[RP]=createGraphics((int)(centerImg[RP].width*2), (int)(centerImg[RP].height*2), JAVA2D);
      g[RP].beginDraw();

      g[RP].imageMode(CENTER);
      g[RP].image(centerImg[RP], g[RP].width/2.0, g[RP].height/2.0);

      centerImg[RP]=im.rev(centerImg[RP]);
      g[RP].imageMode(CENTER);
      for (int TR=0; TR<3; TR++) {
        float px=g[RP].width/2.0+centerImg[RP].width/2.0*cos(radians(-90-60-TR*120+(deg+RP*180)));
        float py=g[RP].height/2.0+centerImg[RP].height/2.0*sin(radians(-90-60-TR*120+(deg+RP*180)));
        runImg[RP]=im.rot(centerImg[RP], 30+TR*60+deg);
        g[RP].image(runImg[RP], px, py);
      }
      centerImg[RP]=im.rev(centerImg[RP]);

      g[RP].endDraw();

      if (RP<DIMENSION-1) {
        centerImg[RP+1]=g[RP];
        runImg[RP+1]=centerImg[RP+1];
      }
    }

    imageMode(CENTER);
    image(g[DIMENSION-1], width/2.0, height/2.0);
  }

  void setDeg(int _deg) {
    deg=_deg;
    trc.setDeg(deg);
  }

  void setGenga(PImage _genga) {
    genga=_genga;
    trc.setGenga(genga);
  }
}