import 'dart:convert';

import 'package:yemek_siparis_uygulamasi/model/sepet_yemekler_cevap.dart';
import 'package:yemek_siparis_uygulamasi/model/yemek.dart';
import 'package:yemek_siparis_uygulamasi/model/yemekler_cevap.dart';
import 'package:http/http.dart' as http;

class YemeklerRepository {

  List<Yemek> parseYemekCevap(String cevap) {
    return YemeklerCevap.fromJson(json.decode(cevap)).yemekler;
  }

  List<Yemek> parseSepettekiYemekCevap(String cevap) {
    return SepetYemeklerCevap.fromJson(json.decode(cevap)).sepet_yemekler;
  }

  Future<List<Yemek>> tumYemekleriAl() async {
    var url = Uri.parse('http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php');
    var cevap = await http.get(url);
    return parseYemekCevap(cevap.body);
  }

  Future<void> sepeteYemekEkle(String yemek_adi, String yemek_resim_adi, int yemek_fiyat, int yemek_siparis_adet, String kullanici_adi) async {
    var url = Uri.parse('http://kasimadalan.pe.hu/yemekler/sepeteYemekEkle.php');
    var veri = {"yemek_adi": yemek_adi, "yemek_resim_adi": yemek_resim_adi, "yemek_fiyat": yemek_fiyat.toString(), "yemek_siparis_adet": yemek_siparis_adet.toString(), "kullanici_adi": kullanici_adi};
    await http.post(url, body: veri);
  }

  Future<List<Yemek>> sepettekiYemekleriGetir(String kullanici_adi) async {
    var url = Uri.parse('http://kasimadalan.pe.hu/yemekler/sepettekiYemekleriGetir.php');
    var veri = {"kullanici_adi": kullanici_adi};
    var cevap = await http.post(url, body: veri);
    return parseSepettekiYemekCevap(cevap.body);
    }

  Future<void> sepettenYemekSil(int sepet_yemek_id, String kullanici_adi) async {
    var url = Uri.parse('http://kasimadalan.pe.hu/yemekler/sepettenYemekSil.php');
    var veri = {"sepet_yemek_id": sepet_yemek_id.toString(), "kullanici_adi": kullanici_adi};
    await http.post(url, body: veri);
  }
}