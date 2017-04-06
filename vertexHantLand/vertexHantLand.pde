World world=new World();

void setup() {
  size(500, 500);
}

void draw() {
  background(0);

  world.step();
  world.display();
}

void keyPressed() {
  if (keyCode==ENTER) {
    Poly poly=new Poly();
    world.add(poly);
    poly.go(world);
  } else if (keyCode==CONTROL) {
    try {
      saveFrame("screenshot.png");
    } 
    catch (Exception e) {
    }
  }
}