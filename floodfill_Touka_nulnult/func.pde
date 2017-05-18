void changeWindowSize(int w, int h) {
  surface.setSize( w + frame.getInsets().left + frame.getInsets().right, h + frame.getInsets().top + frame.getInsets().bottom );
  size(w, h);
}

void floodfill(int X, int Y, int R, int G, int B) {
  color goColor=color(R, G, B);
  color XYColor=buffPixels[X][Y];
  ArrayList<Point> nextXYseeds=new ArrayList();

  if (goColor==XYColor) {
    println("return");
    return;
  }


  nextXYseeds.add(new Point(X, Y));

  while (nextXYseeds.size()>0) {
    ArrayList<Point> tempNextXYseeds=new ArrayList();
    for (int s=0; s<nextXYseeds.size(); s++) {
      int seedX=nextXYseeds.get(s).getX();
      int seedY=nextXYseeds.get(s).getY();
      //println(seedX, seedY);

      int XL, XR;

      //(seedX,seedY)から左端XLの走査
      XL=seedX;
      while (XL-1>=0) {
        if (buffPixels[XL-1][seedY]!=buffPixels[seedX][seedY]) {
          break;
        }
        XL--;
        println(XL, seedY);
      }

      //(seedX,seedY)から右端XRの走査
      XR=seedX;
      while (XR+1<=widthOfBuffPixels-1) {
        if (buffPixels[XR+1][seedY]!=buffPixels[seedX][seedY]) {
          break;
        }
        XR++;
        println(XR, seedY);
      }

      //XLからXRまでgoColorにする
      for (int i=XL; i<=XR; i++) {
        buffPixels[i][seedY]=goColor;
      }

      //tempNextXYseedsに入れる位置を走査して入れる
      for (int i=XL; i<=XR; i++) {
        if (seedY-1>=0) {
          if (buffPixels[i][seedY-1]==XYColor && (i==XR || buffPixels[i+1][seedY-1]!=XYColor)) {
            tempNextXYseeds.add(new Point(i, seedY-1));
          }
        }

        if (seedY+1<heightOfBuffPixels) {
          if (buffPixels[i][seedY+1]==XYColor && (i==XR || buffPixels[i+1][seedY+1]!=XYColor)) {
            tempNextXYseeds.add(new Point(i, seedY+1));
          }
        }
      }
    }
    nextXYseeds=tempNextXYseeds;
  }
  println("end");
}