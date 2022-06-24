import 'package:yemek_siparis_uygulamasi/model/yemek.dart';

class SepetYemeklerCevap {
  List<Yemek> sepet_yemekler;
  int success;

  SepetYemeklerCevap({required this.sepet_yemekler, required this.success});

  factory SepetYemeklerCevap.fromJson(Map<String,dynamic> json) {
    var yemeklerListesi = json["sepet_yemekler"] as List;
    var sepet_yemekler = yemeklerListesi.map((e) => Yemek.fromJson(e)).toList();
    return SepetYemeklerCevap(
        sepet_yemekler: sepet_yemekler,
        success: json["success"] as int
    );
  }
}