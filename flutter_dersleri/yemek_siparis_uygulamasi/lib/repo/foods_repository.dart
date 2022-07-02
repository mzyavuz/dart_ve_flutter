import 'dart:convert';

import 'package:yemek_siparis_uygulamasi/model/order_foods_answer.dart';
import 'package:yemek_siparis_uygulamasi/model/food.dart';
import 'package:yemek_siparis_uygulamasi/model/foods_answer.dart';
import 'package:http/http.dart' as http;

class FoodsRepository {

  List<Food> parseFoodAnswer(String cevap) {
    return FoodsAnswer.fromJson(json.decode(cevap)).yemekler;
  }

  List<Food> parseFoodsAtOrderAnswer(String cevap) {
    List<Food> sepet_yemekler = [];
    try {
      if (cevap.contains(RegExp(r'[A-Z]'))) {
        sepet_yemekler = OrderFoodsAnswer.fromJson(json.decode(cevap)).sepet_yemekler;
      }
    } catch (e) {
      print(e);
    }
    return sepet_yemekler;
  }

  Future<List<Food>> getAllFoods() async {
    var url = Uri.parse('http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php');
    var cevap = await http.get(url);
    return parseFoodAnswer(cevap.body);
  }

  Future<void> addFoodToCart(String yemek_adi, String yemek_resim_adi, int yemek_fiyat, int yemek_siparis_adet, String kullanici_adi) async {
    var url = Uri.parse('http://kasimadalan.pe.hu/yemekler/sepeteYemekEkle.php');
    var veri = {"yemek_adi": yemek_adi, "yemek_resim_adi": yemek_resim_adi, "yemek_fiyat": yemek_fiyat.toString(), "yemek_siparis_adet": yemek_siparis_adet.toString(), "kullanici_adi": kullanici_adi};
    await http.post(url, body: veri);
  }

  Future<List<Food>> getFoodsAtCart(String kullanici_adi) async {
    var url = Uri.parse('http://kasimadalan.pe.hu/yemekler/sepettekiYemekleriGetir.php');
    var veri = {"kullanici_adi": kullanici_adi};
    var cevap = await http.post(url, body: veri);
    return parseFoodsAtOrderAnswer(cevap.body);
    }

  Future<void> deleteFoodFromCart(int sepet_yemek_id, String kullanici_adi) async {
    var url = Uri.parse('http://kasimadalan.pe.hu/yemekler/sepettenYemekSil.php');
    var veri = {"sepet_yemek_id": sepet_yemek_id.toString(), "kullanici_adi": kullanici_adi};
    await http.post(url, body: veri);
  }

  List<Food> removeFoodsFromCart(List<Food> adjustedList, String yemek_adi) {
    adjustedList.removeWhere((element) => element.yemek_adi == yemek_adi);
    return adjustedList;
  }
}