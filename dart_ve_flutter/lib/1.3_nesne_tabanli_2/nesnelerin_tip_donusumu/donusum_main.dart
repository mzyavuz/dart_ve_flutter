import 'package:ders_1/1.3_nesne_tabanli_2/inheritance/ev.dart';
import 'package:ders_1/1.3_nesne_tabanli_2/inheritance/saray.dart';
import 'package:ders_1/1.3_nesne_tabanli_2/inheritance/villa.dart';

void main() {
  var topkapiSarayi = Saray(10, 200);
  var bogazVilla = Villa(true, 20);

  print(topkapiSarayi.kuleSayisi);
  print(topkapiSarayi.pencereSayisi);

  print(bogazVilla.garajVarMi);
  print(bogazVilla.pencereSayisi);

/*
kalıtım yine şart

downcasting: üst sınıfı subclassa dönüştürür
upcasting: alt sınıfı superclassa dönüştürür
*/

  if (topkapiSarayi is Saray) {
    print("Saraydır");
  } else {
    print("Saray değildir");
  }

  //Downcasting
  var ev = Ev(5);
  var saray = ev as Saray;

  //Upcasting
  var villa = Villa(false, 8);
  var ev2 = villa;
}