import 'dart:convert';

import 'package:kisiler_uygulamasi/entity/kisiler.dart';
import 'package:kisiler_uygulamasi/entity/kisiler_cevap.dart';
import 'package:http/http.dart' as http;


class KisilerDaoRepository {
  
  List<Kisiler> parseKisilerCevap(String cevap) {
    return KisilerCevap.fromJson(json.decode(cevap)).kisiler;
  }

  Future<void> kisiKayit(String kisi_ad, String kisi_tel) async {
    var url = Uri.parse('http://kasimadalan.pe.hu/kisiler/insert_kisiler.php');
    //POST (Bizden iki değer istiyor)
    var veri = {"kisi_ad": kisi_ad, "kisi_tel": kisi_tel};
    var cevap = await http.post(url, body: veri);
    print("kişi ekle: ${cevap.body}");
  }

  Future<void> kisiGuncelle(int kisi_id, String kisi_ad, String kisi_tel) async {
    var url = Uri.parse('http://kasimadalan.pe.hu/kisiler/update_kisiler.php');
    //POST (Bizden üç değer istiyor)
    var veri = {"kisi_id": kisi_id.toString(), "kisi_ad": kisi_ad, "kisi_tel": kisi_tel};
    var cevap = await http.post(url, body: veri);
    print("kişi güncelle: ${cevap.body}");
  }

  Future<List<Kisiler>> tumKisileriAl() async {
    var url = Uri.parse("http://kasimadalan.pe.hu/kisiler/tum_kisiler.php");
    //GET (Bizden veri göndermemizi istemiyorsa)
    //POST (Bizden veri göndermemizi istiyorsa)
    var cevap = await http.get(url); //String olarak veri geliyor
    return parseKisilerCevap(cevap.body);
  }

  Future<List<Kisiler>> kisiAra(String aramaKelimesi) async {
    var url = Uri.parse('http://kasimadalan.pe.hu/kisiler/tum_kisiler_arama.php');
    //POST (Bizden üç değer istiyor)
    var veri = {"kisi_ad": aramaKelimesi};
    var cevap = await http.post(url, body: veri);
    return parseKisilerCevap(cevap.body);
  }

  Future<void> kisiSil(int kisi_id) async {
    var url = Uri.parse('http://kasimadalan.pe.hu/kisiler/delete_kisiler.php');
    //POST (Bizden üç değer istiyor)
    var veri = {"kisi_id": kisi_id.toString()};
    var cevap = await http.post(url, body: veri);
    print("kişi sil: ${cevap.body}");
  }

}