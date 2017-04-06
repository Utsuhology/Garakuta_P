String StringToln(String txt) {
  ArrayList<String> plant=new ArrayList();
  String result="";

  String line="";
  for (int i=0; i<txt.length(); i++) {
    if (textWidth(line+txt.charAt(i))>100) {
      plant.add(line);
      line=str(txt.charAt(i));
    } else {
      line+=txt.charAt(i);
    }
  }
  plant.add(line);

  for (int i=0; i<plant.size(); i++) {
    result+=plant.get(i)+"\n";
  }

  return result;
}