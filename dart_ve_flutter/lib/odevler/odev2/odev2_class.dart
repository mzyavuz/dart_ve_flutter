class Odev2 {

  // 1
  double toFahrenheit(double celciusDerece ) {
    double fahrenheitDerece = (celciusDerece * 1.8) + 32;
    return fahrenheitDerece;
  }

  // 2
  void dikdortgenCevresiHesapla(double kenar1, double kenar2) {
    double dikdortgenCevresi = 2 * (kenar1 + kenar2);
    print(dikdortgenCevresi);
  }

  // 3
  int faktoriyel(int sayi) {
    int sonuc = 1;
    while (sayi > 0) {
      sonuc = sonuc * sayi;
      sayi -= 1;
    }
    return sonuc;
  }


}