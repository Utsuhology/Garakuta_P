import java.awt.Color;
import java.awt.Container;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JTextField;
import java.awt.Toolkit;
import java.awt.Dimension;

public class SubjectFrame extends JFrame {
  int x, y;
  String days[]={"月", "火", "水", "木", "金", "土"};
  String subject;

  JTextField subjectTextField;

  SubjectFrame(String _subject, int _x, int _y) {
    this.x=_x; 
    this.y=_y;
    this.subject=_subject;

    setTitle("Subject of "+days[this.x]+(this.y+1));

    Dimension d=Toolkit.getDefaultToolkit().getScreenSize();
    setBounds((int)(d.width*random(0.10, 0.60)), (int)(d.height*random(0.10, 0.60)), 400, 300);

    setResizable(false);
    setDefaultCloseOperation(JFrame.DISPOSE_ON_CLOSE);


    Container cp=getContentPane();
    cp.setLayout(null);
    cp.setBackground(Color.BLACK);

    subjectTextField=new JTextField(subject);
    subjectTextField.setBounds(60, 120, 280, 20);
    subjectTextField.setCaretPosition(subjectTextField.getText().length());
    cp.add(subjectTextField);
  }

  String getSubject() {
    return this.subjectTextField.getText();
  }
}