
import 'package:ders_1/1.3_nesne_tabanli_2/1.3.0_composition/yonetmenler.dart';

import 'kategoriler.dart';

class Filmler {
  int film_id;
  String film_ad;
  int film_yil;
  Kategoriler kategori;
  Yonetmenler yonetmen;

  Filmler({
    required this.film_id,
    required this.film_ad,
    required this.film_yil,
    required this.kategori,
    required this.yonetmen
  });
}