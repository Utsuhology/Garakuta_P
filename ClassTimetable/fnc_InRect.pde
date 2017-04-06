boolean inRect(int x, int y, int w, int h) {
  return (mouseX>x && mouseX<x+w && mouseY>y && mouseY<y+h);
}