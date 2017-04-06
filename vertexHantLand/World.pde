class World {
  ArrayList plant=new ArrayList();
  boolean oneAllowed=false;

  void add(Poly samp) {
    plant.add(samp);
  }

  void step() {
    //個々の更新とoneAllowed判定
    for (int RP=plant.size()-1; RP>=0; RP--) {
      Poly sys=(Poly)plant.get(RP);
      sys.step();
      if (sys.dragAllow==true && oneAllowed==false) {
        oneAllowed=true;
      }
    }

    //図形同士の重なり判定に際してまず全てfalseにする
    for (int RP=0; RP<plant.size(); RP++) {
      Poly sys=(Poly)plant.get(RP);
      sys.coll=false;
    }

    //図形同士の重なり判定
    for (int RPc=0; RPc<plant.size()-1; RPc++) {
      Poly hantA=(Poly)plant.get(RPc);
      for (int RPcc=RPc+1; RPcc<plant.size(); RPcc++) {
        Poly hantB=(Poly)plant.get(RPcc);

        for (int RPdivA=0; RPdivA<hantA.listdivx0.size() /*=hantA.listdivy0.size()*/; RPdivA++) {
          if (hantB.buff.get((int)((float)hantA.listdivx0.get(RPdivA)+hantA.ptidox-hantB.ptidox), (int)((float)hantA.listdivy0.get(RPdivA)+hantA.ptidoy-hantB.ptidoy))!=0) {
            hantA.coll=true;
            hantB.coll=true;
          }
        }

        for (int RPdivB=0; RPdivB<hantB.listdivx0.size() /*=hantB.listdivy0.size()*/; RPdivB++) {
          if (hantA.buff.get((int)((float)hantB.listdivx0.get(RPdivB)+hantB.ptidox-hantA.ptidox), (int)((float)hantB.listdivy0.get(RPdivB)+hantB.ptidoy-hantA.ptidoy))!=0) {
            hantA.coll=true;
            hantB.coll=true;
          }
        }
      }
    }
  }

  void display() {
    for (int RP=0; RP<plant.size(); RP++) {
      Poly sys=(Poly)plant.get(RP);
      sys.display();
    }
  }
}