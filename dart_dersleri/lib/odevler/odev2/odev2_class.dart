class Odev2 {

  // 1
  double toFahrenheit(double celciusDerece ) {
    double fahrenheitDerece = 0;
    if (celciusDerece >= -273 && celciusDerece < 100 ) {
      fahrenheitDerece = (celciusDerece * 1.8) + 32;
    } else {
      print("Lütfen '-273' ile '100' aralığında bir sayı giriniz");
    }
    return fahrenheitDerece;
  }

  // 2
  void dikdortgenCevresiHesapla(double kenar1, double kenar2) {
    if (kenar1 > 0 && kenar2 > 0) {
      double dikdortgenCevresi = 2 * (kenar1 + kenar2);
      print(dikdortgenCevresi);
    } else {
      print("Lütfen pozitif değerler giriniz.");
    }


  }

  // 3
  int faktoriyel(int sayi) {
    if (sayi == 0) {
      return 1;
    } else if (sayi > 1) {
      int sonuc = sayi;
      while (sayi > 1) {
        sonuc *= (sayi-1);
        sayi -= 1;
      }
      return sonuc;
    } else {
      print("Lütfen doğal sayı giriniz!");
      return 0;
    }
  }

  //4
  void kacTaneVar(String kelime, String harf) {
    int i = 0;
    int toplamSayi = 0;
    while ( i <= kelime.length-1) {
      if (kelime[i] == harf) {
        toplamSayi += 1;
      }
      i += 1;
    }
    print(toplamSayi);
  }

  //5
  int icAcilarToplami(int kenarSayisi) {
    if (kenarSayisi > 0) {
      int icAci = (kenarSayisi - 2) * 180;
      return icAci;
    } else {
      print("Lütfen bir doğal sayı giriniz.");
      return 0;
    }

  }

  //6
  double maasHesabi(double calisilanGun) {
    double maas = 0;
    if (calisilanGun > 31) {
      print("Lütfen 31'den az doğal sayi giriniz");
    } else if (calisilanGun > 20) {
      maas = (20*80) + ((calisilanGun-20) * 160);
    } else if (calisilanGun <= 20) {
      maas = calisilanGun * 80;
    } else {
      print("Lütfen bir doğal sayı giriniz.");
    }
    return maas;
  }

  //7
  int internetUcreti(int toplamGB) {
    int ucret = 100;
    if (toplamGB > 50) {
      ucret = 100 + ((toplamGB - 50) * 4);
    }
    return ucret;
  }

}