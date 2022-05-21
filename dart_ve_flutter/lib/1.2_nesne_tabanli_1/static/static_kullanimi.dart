
import 'asinifi.dart';

void main() {
  var a = ASinifi();

  print(ASinifi.degisken); //print(ASinifi().degisken);
  /*
  Parentez varsa sanal sınıftır, parentez yoksa static yapıdır.
   */
  //print(a.oran); //eğer a yerine ASinifi() kullansaydık sanal nesne kullanmış oluyorduk

  //a.metod();

  // Static'lere sadece isimle erişebilirsiniz

  /*
  Web servislerle sık sık eriştiğiniz bir url varsa static olarak kullanabilirsiniz
   */
}