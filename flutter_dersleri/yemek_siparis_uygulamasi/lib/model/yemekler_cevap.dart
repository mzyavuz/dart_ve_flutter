import 'package:yemek_siparis_uygulamasi/model/yemek.dart';

class YemeklerCevap {
  List<Yemek> yemekler;
  int success;

  YemeklerCevap({required this.yemekler, required this.success});
  
  factory YemeklerCevap.fromJson(Map<String,dynamic> json) {
    var yemeklerListesi = json["yemekler"] as List;
    var yemekler = yemeklerListesi.map((e) => Yemek.fromJson(e)).toList();
    return YemeklerCevap(
      yemekler: yemekler,
      success: json["success"] as int
    );
  }
}