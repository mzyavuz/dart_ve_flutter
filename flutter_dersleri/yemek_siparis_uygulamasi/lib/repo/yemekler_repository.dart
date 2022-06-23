import 'dart:convert';

import 'package:yemek_siparis_uygulamasi/model/yemek.dart';
import 'package:yemek_siparis_uygulamasi/model/yemekler_cevap.dart';
import 'package:http/http.dart' as http;

class YemeklerRepository {

  List<Yemek> parseYemekCevap(String cevap) {
    return YemeklerCevap.fromJson(json.decode(cevap)).yemekler;
  }

  Future<List<Yemek>> tumYemekleriAl() async {
    var url = Uri.parse('http://kasimadalan.pe.hu/yemekler/tumYemekleriGetir.php');
    var cevap = await http.get(url);
    return parseYemekCevap(cevap.body);
  }
}