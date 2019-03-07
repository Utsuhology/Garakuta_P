float qPx(float _x, float _r, float _deg) { //x
  return _x+_r*cos(radians(_deg));
}

float qPy(float _y, float _r, float _deg) { //y
  return _y+_r*sin(radians(_deg));
}