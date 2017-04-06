class Poly {
  ArrayList listpx0=new ArrayList();
  ArrayList listpy0=new ArrayList();
  ArrayList listdivx0=new ArrayList();
  ArrayList listdivy0=new ArrayList();

  ArrayList legion=new ArrayList();

  int pnum=(int)random(3, 11);

  float px0[]=new float[pnum];
  float py0[]=new float[pnum];
  float ptx, pty;
  float ptidox=0, ptidoy=0;

  PGraphics buff;

  float dx, dy;
  boolean dragAllow=false;
  boolean taken=false;

  boolean coll=false;

  float Uy, Dy, Lx, Rx;

  void go(World samp) {
    //addされたWorldに再登録する
    legion.add(samp);

    //（以下もろもろ初期設定）

    //ランダムにポイントする
    for (int RP=0; RP<pnum; RP++) {
      px0[RP]=random(50, 150);
      py0[RP]=random(50, 150);
    }

    //確定したポイントをリストにぶちこむ
    for (int RP=0; RP<pnum; RP++) {
      listpx0.add(px0[RP]);
      listpy0.add(py0[RP]);
    }

    //ポイントのうちでそれぞれの端を決める
    Uy=py0[0];
    Dy=py0[0];
    Lx=px0[0];
    Rx=px0[0];
    for (int RP=1; RP<pnum; RP++) {
      if (py0[RP]<Uy) {
        Uy=py0[RP];
      }
      if (py0[RP]>Dy) {
        Dy=py0[RP];
      }
      if (px0[RP]<Lx) {
        Lx=px0[RP];
      }
      if (px0[RP]>Rx) {
        Rx=px0[RP];
      }
    }

    //divを打ってリストにぶちこむ
    for (int RPp=0; RPp<listpx0.size() /*=listpy0.size()*/; RPp++) {
      for (int RPd=0; RPd<16; RPd++) {
        float divx0=(float)(RPd*((float)listpx0.get((RPp+1)%listpx0.size())-(float)listpx0.get(RPp%listpx0.size()))/16.0+(float)listpx0.get(RPp%listpx0.size()));
        listdivx0.add(divx0);
        float divy0=(float)(RPd*((float)listpy0.get((RPp+1)%listpx0.size())-(float)listpy0.get(RPp%listpx0.size()))/16.0+(float)listpy0.get(RPp%listpx0.size()));
        listdivy0.add(divy0);
      }
    }

    //ptをp0とする
    ptx=px0[0];
    pty=py0[0];

    //buffをつくる
    buff=createGraphics(width, height, JAVA2D);
    buff.beginDraw();
    buff.fill(0); //black
    buff.stroke(0);
    buff.strokeWeight(1);
    buff.beginShape();
    for (int RP=0; RP<pnum; RP++) {
      buff.vertex((float)listpx0.get(RP), (float)listpy0.get(RP));
    }
    buff.endShape(CLOSE);
    buff.endDraw();
  }

  void step() {
    //goしたWorldの情報を使うためにsysに取得
    World sys=(World)legion.get(0);

    //Drag可能性判定
    if (mousePressed==true && taken==false) {
      if (buff.get((int)(mouseX-ptidox), (int)(mouseY-ptidoy))!=0 && sys.oneAllowed==false) {
        dragAllow=true;
        sys.oneAllowed=true;
        dx=mouseX-ptx;
        dy=mouseY-pty;
      }
      taken=true;
    } else if (mousePressed==false) {
      taken=false;
      dragAllow=false;
      sys.oneAllowed=false;
    }

    //Drag移動
    if (dragAllow==true) {
      ptx=mouseX-dx;
      pty=mouseY-dy;
      ptidox=ptx-px0[0];
      ptidoy=pty-py0[0];
    }

    //端制御
    if (Uy+ptidoy<0) {
      pty=pty+(0-Uy-ptidoy);
      ptidoy=pty-py0[0];
    }
    if (Dy+ptidoy>height) {
      pty=pty-(Dy+ptidoy-height);
      ptidoy=pty-py0[0];
    }
    if (Lx+ptidox<0) {
      ptx=ptx+(0-Lx-ptidox);
      ptidox=ptx-px0[0];
    }
    if (Rx+ptidox>width) {
      ptx=ptx-(Rx+ptidox-width);
      ptidox=ptx-px0[0];
    }
  }

  void display() {
    if (coll==true) {
      fill(0, 0, 255, 100);
    } else {
      fill(255, 100);
    }
    stroke(255, 200);
    strokeWeight(1);
    beginShape();
    for (int RPp=0; RPp<listpx0.size() /*=listpy0.size()*/; RPp++) {
      vertex((float)listpx0.get(RPp)+ptidox, (float)listpy0.get(RPp)+ptidoy);
    }
    endShape(CLOSE);
  }
}