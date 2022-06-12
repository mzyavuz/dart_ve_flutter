import 'package:kisiler_uygulamasi/entity/kisiler.dart';
import 'package:kisiler_uygulamasi/sqlite/veritabani_yardimcisi.dart';

class KisilerDaoRepository {

  Future<void> kisiKayit(String kisi_ad, String kisi_tel) async {
    //print("Kisi kayıt: $kisi_ad - $kisi_tel");
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    var bilgiler = Map<String, dynamic>();
    bilgiler["kisi_ad"] = kisi_ad;
    bilgiler["kisi_tel"] = kisi_tel;

    await db.insert("kisiler", bilgiler);

  }

  Future<void> kisiGuncelle(int kisi_id, String kisi_ad, String kisi_tel) async {
    //print("Kisi güncelle: $kisi_id - $kisi_ad - $kisi_tel");
    var db = await VeritabaniYardimcisi.veritabaniErisim();

    var bilgiler = Map<String, dynamic>();
    bilgiler["kisi_ad"]= kisi_ad;
    bilgiler["kisi_tel"]= kisi_tel;

    await db.update("kisiler", bilgiler, where: "kisi_id = ?", whereArgs: [kisi_id]);
  }

  Future<List<Kisiler>> tumKisileriAl() async {
    /*
    var kisilerListesi = <Kisiler>[];
    var k1 = Kisiler(kisi_id: 1, kisi_ad: "Ahmet", kisi_tel: "1111");
    var k2 = Kisiler(kisi_id: 2, kisi_ad: "Zeynep", kisi_tel: "2222");
    var k3 = Kisiler(kisi_id: 3, kisi_ad: "Beyza", kisi_tel: "3333");
    kisilerListesi.add(k1);
    kisilerListesi.add(k2);
    kisilerListesi.add(k3);
    return kisilerListesi;
    */

    var db = await VeritabaniYardimcisi.veritabaniErisim();
    List<Map<String, dynamic>> maps = await db.rawQuery("SELECT * FROM kisiler");

    return List.generate(maps.length, (i) {
      var satir = maps[i];
      return Kisiler(kisi_id: satir["kisi_id"], kisi_ad: satir["kisi_ad"], kisi_tel: satir["kisi_tel"]);
    });
  }

  Future<List<Kisiler>> kisiAra(String aramaKelimesi) async {
    /*
    var kisilerListesi = <Kisiler>[];
    var k1 = Kisiler(kisi_id: 1, kisi_ad: "Ahmet", kisi_tel: "1111");
    var k2 = Kisiler(kisi_id: 2, kisi_ad: "Zeynep", kisi_tel: "2222");
    kisilerListesi.add(k1);
    kisilerListesi.add(k2);
    return kisilerListesi;
     */

    var db = await VeritabaniYardimcisi.veritabaniErisim();
    List<Map<String, dynamic>> maps = await db.rawQuery("SELECT * FROM kisiler WHERE kisi_ad like '%$aramaKelimesi%'");

    return List.generate(maps.length, (i) {
      var satir = maps[i];
      return Kisiler(kisi_id: satir["kisi_id"], kisi_ad: satir["kisi_ad"], kisi_tel: satir["kisi_tel"]);
    });
  }

  Future<void> kisiSil(int kisi_id) async {
    //print("Kisi sil : $kisi_id");
    var db = await VeritabaniYardimcisi.veritabaniErisim();
    await db.delete("kisiler", where: "kisi_id = ?", whereArgs: [kisi_id]);
  }

}