
import 'hayvan.dart';
import 'kedi.dart';
import 'kopek.dart';
import 'memeli.dart';


/*
kalıtım olmazsa 1.3.2_override olmaz,
üst sınıftaki yapıyı(metodu) aşağı sınıfta tekrar kullanmak için kullanılıyor
*/

void main() {
  var hayvan = Hayvan();
  var memeli = Memeli();
  var kedi = Kedi();
  var kopek = Kopek();

  hayvan.sesCikar();
  memeli.sesCikar(); //Hayvan sınıfının metoduna erişir
  kedi.sesCikar();
  kopek.sesCikar();

}