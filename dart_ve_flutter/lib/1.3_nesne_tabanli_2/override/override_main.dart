
import 'package:ders_1/1.3_nesne_tabanli_2/override/hayvan.dart';
import 'package:ders_1/1.3_nesne_tabanli_2/override/kedi.dart';
import 'package:ders_1/1.3_nesne_tabanli_2/override/kopek.dart';
import 'package:ders_1/1.3_nesne_tabanli_2/override/memeli.dart';

/*
kalıtım olmazsa override olmaz,
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