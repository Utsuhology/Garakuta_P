void slash(float[] px, float[] py) {
  beginShape();
  for (int i=0; i<px.length; i++) {
    vertex(px[i], py[i]);
  }
  endShape(CLOSE);
}