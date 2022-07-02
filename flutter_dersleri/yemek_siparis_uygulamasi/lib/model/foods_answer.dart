import 'package:yemek_siparis_uygulamasi/model/food.dart';

class FoodsAnswer {
  List<Food> yemekler;
  int success;

  FoodsAnswer({required this.yemekler, required this.success});
  
  factory FoodsAnswer.fromJson(Map<String,dynamic> json) {
    var yemeklerListesi = json["yemekler"] as List;
    var yemekler = yemeklerListesi.map((e) => Food.fromJson(e)).toList();
    return FoodsAnswer(
      yemekler: yemekler,
      success: json["success"] as int
    );
  }
}