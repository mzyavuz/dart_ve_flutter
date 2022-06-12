import 'package:odev_6_lokma/model/yemek.dart';

class YemeklerRepository {

  Future<List<Yemek>> yemekleriGetir() async {
    List<Yemek> yemeklerListesi = [];

    var y1 = Yemek(
        yemekAdi: 'Sotelenmiş Taze Fasulye',
        yemekSuresi: '25 DAKİKA',
        yemekFotosu:
        'https://img.piri.net/mnresize/210/-/piri/upload/image/2022/6/2/e590ad25-2_35125b68.png');
    var y2 = Yemek(
        yemekAdi: 'Etli Taze Fasulye',
        yemekSuresi: '1 SAAT 20 DAKİKA',
        yemekFotosu:
        'https://img.piri.net/mnresize/551/-/piri/upload/image/2022/6/2/829d3566-2_c70a05ae.png');
    var y3 = Yemek(yemekAdi: 'Firikli Biber Dolması', yemekSuresi: '1 SAAT', yemekFotosu: 'https://img.piri.net/mnresize/210/-/piri/upload/image/2022/6/2/87b188a5-2_bcad136f.png');
    var y4 = Yemek(yemekAdi: 'Yumurtalı Fasulye Kavurması', yemekSuresi: '15 DAKİKA', yemekFotosu: 'https://img.piri.net/mnresize/210/-/piri/upload/image/2022/6/2/cf450d3b-2_daf5a583.png');
    var y5 = Yemek(yemekAdi: 'Kıymalı Taze Fasulye Yemeği', yemekSuresi: '40 DAKİKA', yemekFotosu: 'https://img.piri.net/mnresize/210/-/piri/upload/image/2022/6/2/c03bf73d-2_9925773e.png');
    var y6 = Yemek(yemekAdi: 'Tulum Peynirli Bostan Patlıcan', yemekSuresi: ' ', yemekFotosu: 'https://img.piri.net/mnresize/210/-/piri/upload/image/2021/6/21/a909bc8d-2_bd7bc6ef.png');
    var y7 = Yemek(yemekAdi: 'Izgara Biberler', yemekSuresi: '30 DAKİKA', yemekFotosu: 'https://img.piri.net/mnresize/210/-/piri/upload/image/2022/5/3/752e0a03-2_c756667a.png');
    var y8 = Yemek(yemekAdi: 'Etli Enginar Yemeği', yemekSuresi: '45 DAKİKA', yemekFotosu: 'https://img.piri.net/mnresize/210/-/piri/upload/image/2022/4/30/67dc49e8-2_98165178.png');

    yemeklerListesi.add(y1);
    yemeklerListesi.add(y2);
    yemeklerListesi.add(y3);
    yemeklerListesi.add(y4);
    yemeklerListesi.add(y5);
    yemeklerListesi.add(y6);
    yemeklerListesi.add(y7);
    yemeklerListesi.add(y8);

    return yemeklerListesi;
  }
}