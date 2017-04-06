class DataManager {
  String lines[];
  String subject[][]=new String[6][6];

  DataManager(String _lines[]) {
    this.lines=_lines;

    if (this.lines.length!=6) {
      println("Error on data format.");
      println("data.txt should be composed of 6 lines,");
      println("and each line should be like below:");
      println("subject,subject,subject,subject,subject,subject");
    } else {
      for (int i=0; i<this.lines.length; i++) {
        String _subject[]=split(lines[i], ",");
        if (_subject.length!=6) {
          println("Error on data format.");
          println("data.txt should be composed of 6 lines,");
          println("and each line should be like below:");
          println("subject,subject,subject,subject,subject,subject");
          break;
        }
      }
      for (int iy=0; iy<6; iy++) {
        String _subject[]=split(lines[iy], ",");
        for (int ix=0; ix<6; ix++) {
          this.subject[ix][iy]=_subject[ix];
        }
      }
    }
  }

  String getSubjectOf(int _x, int _y) {
    return this.subject[_x][_y];
  }

  void setSubjectOf(String _subject, int _x, int _y) {
    this.subject[_x][_y]=_subject;
  }

  void save() {
    for (int iy=0; iy<6; iy++) {
      this.lines[iy]="";
      for (int ix=0; ix<6; ix++) {
        this.lines[iy]+=this.subject[ix][iy];
        if (ix!=5)lines[iy]+=",";
      }
    }
    saveStrings("data.txt", this.lines);
  }
}