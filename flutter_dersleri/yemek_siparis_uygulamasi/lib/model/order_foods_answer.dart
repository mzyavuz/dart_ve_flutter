import 'package:yemek_siparis_uygulamasi/model/food.dart';

class OrderFoodsAnswer {
  List<Food> sepet_yemekler;
  int success;

  OrderFoodsAnswer({required this.sepet_yemekler, required this.success});

  factory OrderFoodsAnswer.fromJson(Map<String,dynamic> json) {
    var yemeklerListesi = json["sepet_yemekler"] as List;
    var sepet_yemekler = yemeklerListesi.map((e) => Food.fromJson(e)).toList();
    return OrderFoodsAnswer(
        sepet_yemekler: sepet_yemekler,
        success: json["success"] as int
    );
  }
}