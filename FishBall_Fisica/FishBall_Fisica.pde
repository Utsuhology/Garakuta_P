import fisica.*;

int nextSize=(int)random(20, 71);
String[] text={"鮪", "鯖", "鰯", "鰆", "鮫"};

FWorld world;

void setup() {
  size(500, 500);

  Fisica.init(this);
  world=new FWorld();
  world.setEdges();
}

void draw() {
  background(20, 100);

  world.step();
  world.draw();
}

void mousePressed() {
  if (mouseButton==RIGHT) {
    if (inRect(mouseX, mouseY, nextSize/2.0, nextSize/2.0, width-nextSize/2.0, height-nextSize/2.0)==true) {
      putABall(mouseX, mouseY);
      nextSize=(int)random(20, 71);
    }
  }
}



//------------------------------------------------------------------


void putABall(float x, float y) {
  PGraphics fishG=createGraphics(nextSize*2, nextSize*2, JAVA2D);
  fishG.beginDraw();

  fishG.fill(random(256), random(256), random(256), 100);
  fishG.stroke(255, 200);
  fishG.strokeWeight(nextSize*0.1);
  fishG.ellipse(nextSize, nextSize, nextSize, nextSize);

  PFont fishFont=createFont("MS-Mincho", 16);
  fishG.fill(255, 200);
  fishG.textFont(fishFont);
  fishG.textAlign(CENTER);
  fishG.textSize(nextSize*0.5);
  fishG.text(text[(int)(random(5))], nextSize, nextSize+(fishG.textAscent()-fishG.textDescent())/2.0);

  fishG.endDraw();

  FCircle ball=new FCircle(nextSize);
  ball.attachImage(fishG);
  ball.setPosition(x, y);
  world.add(ball);
}