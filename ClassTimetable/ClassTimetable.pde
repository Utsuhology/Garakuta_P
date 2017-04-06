SubjectFrame sf[][]=new SubjectFrame[6][6];
String subject[][]=new String[6][6];
String days[]={"月", "火", "水", "木", "金", "土"};
PFont font;
DataManager dm;

void setup() {
  size(600, 650);
  font=createFont("メイリオ", 16);
  String lines[]=loadStrings("data.txt");
  dm=new DataManager(lines);

  for (int ix=0; ix<6; ix++) {
    for (int iy=0; iy<6; iy++) {
      fill(-1);
      textFont(font, 16);
      textAlign(CENTER, CENTER);
      subject[ix][iy]=dm.getSubjectOf(ix, iy);
      sf[ix][iy]=new SubjectFrame(subject[ix][iy], ix, iy);
    }
  }
}

void draw() {
  background(0);
  display();
  if (frameCount%60==0)stepAndSave();
}

void mousePressed() {
  if (mouseButton==RIGHT) {
    for (int ix=0; ix<6; ix++) {
      for (int iy=0; iy<6; iy++) {
        if (inRect(ix*100, iy*100+50, 100, 100)) {
          sf[ix][iy].setVisible(true);
        }
      }
    }
  }
}

//------------

void display() {
  for (int ix=0; ix<6; ix++) {
    stroke(-1, 100);
    strokeWeight(1);
    noFill();
    rect(ix*100, 0, 100, 50);

    fill(-1);
    textFont(font, 16);
    textAlign(CENTER, CENTER);
    text(days[ix], ix*100+50, 25);
  }
  for (int ix=0; ix<6; ix++) {
    for (int iy=0; iy<6; iy++) {
      stroke(-1);
      strokeWeight(2);
      noFill();
      rect(ix*100, iy*100+50, 100, 100);

      fill(-1);
      textFont(font, 12);
      textAlign(LEFT, TOP);
      text(days[ix]+(iy+1), ix*100, iy*100+50);

      fill(-1);
      textFont(font, 16);
      textAlign(CENTER, CENTER);
      text(StringToln(sf[ix][iy].getSubject()), ix*100+50, iy*100+50+50);
    }
  }
}

void stepAndSave() {
  for (int ix=0; ix<6; ix++) {
    for (int iy=0; iy<6; iy++) {
      dm.setSubjectOf(sf[ix][iy].getSubject(), ix, iy);
    }
  }
  dm.save();
}