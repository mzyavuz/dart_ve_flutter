


import 'package:ders_1/1.3_nesne_tabanli_2/1.3.1_inheritance/villa.dart';
import 'package:ders_1/1.3_nesne_tabanli_2/1.3.3_nesnelerin_tip_donusumu/saray.dart';

void main() {
  var topkapiSarayi = Saray(10, 200);
  var bogazVilla = Villa(true, 20);

  print(topkapiSarayi.kuleSayisi);
  print(topkapiSarayi.pencereSayisi);

  print(bogazVilla.garajVarMi);
  print(bogazVilla.pencereSayisi);
}