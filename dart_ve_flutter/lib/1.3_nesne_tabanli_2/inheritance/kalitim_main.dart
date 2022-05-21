import 'package:ders_1/1.3_nesne_tabanli_2/inheritance/saray.dart';
import 'package:ders_1/1.3_nesne_tabanli_2/inheritance/villa.dart';

void main() {
  var topkapiSarayi = Saray(10, 200);
  var bogazVilla = Villa(true, 20);

  print(topkapiSarayi.kuleSayisi);
  print(topkapiSarayi.pencereSayisi);

  print(bogazVilla.garajVarMi);
  print(bogazVilla.pencereSayisi);
}