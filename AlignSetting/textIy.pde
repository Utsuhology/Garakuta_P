//textAlignでxAlignを明記し、yAlignを設定しないようにすること。

void textIy(String moji, float x, float Iy) {
  float Gy=Iy+(textAscent()-textDescent())/2.0;
  text(moji, x, Gy);
  println(Gy);
  stroke(-1);
  line(0, Gy, width, Gy);
}