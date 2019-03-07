void slashF(float x, float y, float len, float deg, int step) {
  if (len<=gLen*pow(2/3.0, step)) {
    return;
  }

  float[] px=new float[7];
  float[] py=new float[7];
  px[0]=qPx(x, len/2.0, deg+180);
  py[0]=qPy(y, len/2.0, deg+180);
  px[1]=qPx(px[0], len/3.0, deg-60);
  py[1]=qPy(py[0], len/3.0, deg-60);
  px[2]=qPx(px[1], len/3.0, deg+60);
  py[2]=qPy(py[1], len/3.0, deg+60);
  px[3]=qPx(px[2], len/3.0, deg+60);
  py[3]=qPy(py[2], len/3.0, deg+60);
  px[4]=qPx(px[3], len/3.0, deg-60);
  py[4]=qPy(py[3], len/3.0, deg-60);
  px[5]=qPx(px[4], len/3.0, deg-60);
  py[5]=qPy(py[4], len/3.0, deg-60);
  px[6]=qPx(px[5], len/3.0, deg+60);
  py[6]=qPy(py[5], len/3.0, deg+60);
  slash(px, py);

  slashF(px[2], py[2], len*(2/3.0), deg+60, step);
  slashF(px[4], py[4], len*(2/3.0), deg-60, step);
  slashF(px[2], py[2], len*(2/3.0), deg, step);
  slashF(px[4], py[4], len*(2/3.0), deg, step);
}