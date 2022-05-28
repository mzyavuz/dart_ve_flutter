void main() {
  // degisken isimleri camelCase kullanılarak olusturulur.
  var ogrenciAdi = "Ahmet";
  var ogrenciYas = 23;
  var ogrenciBoyu = 1.78;
  var ogrenciBasHarfi = "A";
  var ogrenciDevamEdiyorMu = true;

  print(ogrenciAdi);
  print(ogrenciYas);
  print(ogrenciBoyu);
  print(ogrenciBasHarfi);
  print(ogrenciDevamEdiyorMu);

  //Database de nasıl belirtildiyse o şekilde kullanmak gerekir.
  int urun_id = 3416; // white space: '='in sağına ve soluna boşluk koymak
  String urun_adi = "Kol saati";
  int urun_adet = 100;
  double urun_fiyat = 149.99;
  String urun_tedarikci = "Rolex";

  //int, double, bool -> primitif tiptir
  // String -> referans tiptir  (Sınıftır)
  // Sınıf isimleri büyük harf ile başlar, o yüzden String büyük harfle başlar

  print("Ürün id: $urun_id"); //String insert'ü: tek degisken ise: $degisken , öteki türlü: ${degisken1 + degisken2}
  print("Ürün adı: $urun_adi");
  print("Ürün adet: $urun_adet");
  print("Ürün fiyatı: $urun_fiyat ₺"); //$ işaretinden sonra boşluk koyup devam edebilirsiniz
  print("Ürün tedarikci: $urun_tedarikci");

  print(urun_id.runtimeType); //tipi

  int a = 100;
  int b = 200;

  print("$a ve $b nin toplamı ${a+b}");

  /*
  Yorum paragrafı (satırlar bütünü)
   */

  // Sabitler - Constant
  int sayi = 30; // sayı isminde bir değişken oluşturduk
  sayi = 40; // sayının 30 değil 40 olmasına karar verdim - bu yüzden değişken diyoruz
  print(sayi);

  final int sonuc = 100; // sonuc değeri değişmiyor
  //sonuc = 200; // hata veriyor çünkü final değeri değiştiremezsin
  const double pi = 3.14; // pi değeri değişmiyor.
  //pi = 3.45 // hata veriyor çünkü const değeri değiştiremezsin

  // Neden final ve const kullanıyoruz -> Performansı arttırmak için, var değişken olduğu için çok fazla yer kaplıyor
  /*
  Final tanımladığımızda ve çalıştırdığımızda hafızada yer ayırır.
  Const tanımladığımızda (değişkeni tanımladığımızda) daha yazarken hafızada yer alır.

  Ne zaman bu ayrımı kullanacağız:
  - Görsel nesne kodlamalarında
   */

  print(sonuc);
  print(pi);

}