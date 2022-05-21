//SINIFLARIN İSİMLERİNİ BÜYÜK HARFLE BAŞLAYARAK YAZ!!

class Araba {
  String renk;
  int hiz;
  bool calisiyorMU;

  // cmd + n: constructor
  Araba({required this.renk, required this.hiz, required this.calisiyorMU}); //required olunca artık parametre olarak eklenecek, yazılımcıya tüyo
  //Araba(this.renk, this.hiz, this.calisiyorMU); //sadece veriyi giriyorusun hiz : 100 değil, 100)

  void bilgiAl() { //fonskiyonlarda ikinci kelime büyük harfle başlar
    print("****************************");
    print("Renk: ${renk}");
    print("Hız: ${hiz}");
    print("Çalışıyor Mu: ${calisiyorMU}");
  }

  void calistir() {  //Side effect = fonksiyonla sınıf içerisindeki değerleri değiştirme
    calisiyorMU = true;
    hiz = 5;
  }

  void durdur() {
    calisiyorMU = false;
    hiz = 0;
  }

  void hizlan(int kacKm) {
    //hiz = hiz + kacKm;
    hiz += kacKm;
  }

  void yavasla(int kacKm) {
    hiz -= kacKm;
  }


}