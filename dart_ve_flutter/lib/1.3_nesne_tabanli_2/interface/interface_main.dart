/*
class yapısında kullanılabilir
bir sınıf birden fazla interface alabilir
implements ile eklenir
hazır tasklar gibi düşünebiliriz
interfaceler sınıflara özellik katar
 */

import 'package:ders_1/1.3_nesne_tabanli_2/interface/class_a.dart';

void main() {
  var a = ClassA();

  print(a.degisken);
  a.metod1();
  print(a.metod2());

}