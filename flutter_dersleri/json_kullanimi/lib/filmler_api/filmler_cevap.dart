

import 'package:json_kullanimi/filmler_api/fimler.dart';

class FilmlerCevap {
  List<Filmler> filmler;
  int success;

  FilmlerCevap({required this.filmler, required this.success});

  factory FilmlerCevap.fromJson(Map<String, dynamic> json) {
    var jsonArray = json["filmler"] as List;
    List<Filmler> filmlerListesi =
    jsonArray.map((jsonArrayNesnesi) => Filmler.fromJson(jsonArrayNesnesi)).toList();
    return FilmlerCevap(
        filmler: filmlerListesi,
        success: json["success"] as int
    );
  }
}