


import '../fonksiyonlar/fonksiyonlar.dart';
import 'araba.dart';

void main() {
  // void main() olmazsa bir değer oluşturamayız, çalışan bir yapı olmaz

  //Nesne Oluşturma
  //bmw nesnesi: var bmw = Araba("Mavi", 200, true);
  // otomatik seçimde sarı seçiliyorsa parametrelerde (Araba(x,y,z)) geliyor, mavi de sadece nesne(Araba()) olarak
  var bmw = Araba(renk: "Mavi", hiz: 200, calisiyorMU: true); // required olduğu vakit parametrelerde yazmalı

  //Değer okuma:
  /*
  print("Renk: ${bmw.renk}");
  print("Hız: ${bmw.hiz}");
  print("Çalışıyor Mu: ${bmw.calisiyorMU}");
  */
  bmw.bilgiAl();

  //Değer atama:
  bmw.hiz = 100; // artık hız 200 değil 100
  //print("Yeni Hız: ${bmw.hiz}");

  bmw.bilgiAl();
  bmw.durdur();
  bmw.bilgiAl();
  bmw.calistir();
  bmw.hizlan(50);
  bmw.bilgiAl();

  var limuzin = Araba(renk: "Siyah", hiz: 0, calisiyorMU: false);
  //print("Limo Renk: ${limuzin.renk}");
  //print("Limo Hız: ${limuzin.hiz}");
  //print("Limo Çalışıyor Mu: ${limuzin.calisiyorMU}");

  limuzin.bilgiAl();
  limuzin.calistir();
  limuzin.bilgiAl();
  limuzin.yavasla(2);
  limuzin.bilgiAl();

  //Araba sahin = Araba(renk: "Beyaz", hiz: 50, calisiyorMU: true);
  // classın kendi ismi type olarak verilebilir ama "var" daha iyi olabilir

  var f = Fonksiyonlar();
}