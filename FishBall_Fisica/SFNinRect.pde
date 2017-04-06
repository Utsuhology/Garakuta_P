boolean inRect(float usex, float usey, float x1, float y1, float x2, float y2) {
  boolean resultIR=false;
  if (usex>x1 && usex<x2 && usey>y1 && usey<y2) {
    resultIR=true;
  }
  return resultIR;
}