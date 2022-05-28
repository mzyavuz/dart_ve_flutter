class Fonksiyonlar { //classların ilk harfi büyük olur
  int x=10;

  late int y; // eğer kullanmadan önce değer aktarmazsan uygulama çöker

  Fonksiyonlar() {
    print("Constructır çalıştı");
  }
  //Geri dönüş değer olmayan
  void selamla() {  //void: sadece işlem yapıyor, bir değer iletmiyor. (return yok)
    String sonuc = "Merhaba Ahmet";
    print(sonuc);
  }

  //Geri dönüş değeri olan
  String selamla1() { //sonuc String dönecek
    String sonuc = "Merhaba Ahmet";
    return sonuc;
  }

  String selamla2(String isim) { //sonuc String dönecek
    String sonuc = "Merhaba $isim";
    return sonuc;
  }

  int toplama(int sayi1, int sayi2) {
    int toplam = sayi1 + sayi2;
    return toplam;
  }

}