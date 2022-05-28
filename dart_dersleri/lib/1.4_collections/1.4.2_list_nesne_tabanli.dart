import 'package:ders_1/1.4_collections/1.4.0_ogrenciler.dart';

void main(){

  var o1 = Ogrenciler(no: 200, ad: "Zeynep", sinif: "9C");
  var o2 = Ogrenciler(no: 300, ad: "Ahmet", sinif: "11Z");
  var o3 = Ogrenciler(no: 100, ad: "Beyza", sinif: "12A");

  var ogrencilerListesi = <Ogrenciler>[];

  ogrencilerListesi.add(o1);
  ogrencilerListesi.add(o2);
  ogrencilerListesi.add(o3);

  for(var o in ogrencilerListesi) {
    print("No: ${o.no} - Ad: ${o.ad} - Sınıf: ${o.sinif}");
  }

  Comparator<Ogrenciler> siralama1 = (x,y) => x.no.compareTo(y.no);
  ogrencilerListesi.sort(siralama1); //yukarıdaki işlemi listeye aktarıyoruz
  print("Sayisal Küçükten Büyüğe");
  for(var o in ogrencilerListesi) {
    print("No: ${o.no} - Ad: ${o.ad} - Sınıf: ${o.sinif}");
  }

  Comparator<Ogrenciler> siralama2 = (y,x) => x.no.compareTo(y.no);
  ogrencilerListesi.sort(siralama2); //yukarıdaki işlemi listeye aktarıyoruz
  print("Sayisal Büyükten Küçüğe");
  for(var o in ogrencilerListesi) {
    print("No: ${o.no} - Ad: ${o.ad} - Sınıf: ${o.sinif}");
  }

  Comparator<Ogrenciler> siralama3 = (x,y) => x.ad.compareTo(y.ad);
  ogrencilerListesi.sort(siralama3); //yukarıdaki işlemi listeye aktarıyoruz
  print("Metinsel Küçükten Büyüğe"); //Türkçe karakterleri sona atar
  for(var o in ogrencilerListesi) {
    print("No: ${o.no} - Ad: ${o.ad} - Sınıf: ${o.sinif}");
  }

  Comparator<Ogrenciler> siralama4 = (y,x) => x.ad.compareTo(y.ad);
  ogrencilerListesi.sort(siralama4); //yukarıdaki işlemi listeye aktarıyoruz
  print("Metinsel Büyükten Küçüğe"); //Türkçe karakterleri sona atar
  for(var o in ogrencilerListesi) {
    print("No: ${o.no} - Ad: ${o.ad} - Sınıf: ${o.sinif}");
  }

  //Filtreleme
  //SQL sorgularında "if" yerine "where" kullanılır
  Iterable<Ogrenciler> filtreleme1 = ogrencilerListesi.where((ogrenciNesnesi) {
    return ogrenciNesnesi.no > 100;
  });

  var f1Liste = filtreleme1.toList();

  print("Filtreleme 1");
  for(var o in f1Liste) {
    print("No: ${o.no} - Ad: ${o.ad} - Sınıf: ${o.sinif}");
  }

  Iterable<Ogrenciler> filtreleme2 = ogrencilerListesi.where((ogrenciNesnesi) {
    return ogrenciNesnesi.ad.contains("y");
  });

  var f2Liste = filtreleme2.toList();

  print("Filtreleme 2");
  for(var o in f2Liste) {
    print("No: ${o.no} - Ad: ${o.ad} - Sınıf: ${o.sinif}");
  }
}