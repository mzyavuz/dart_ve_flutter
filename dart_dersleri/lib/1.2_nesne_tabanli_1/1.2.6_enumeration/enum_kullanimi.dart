

import 'konserve_boyut.dart';

void main() {
  ucretHesapla(100, KonserveBoyut.Orta);

}

void ucretHesapla(int adet, KonserveBoyut boyut) {
  switch(boyut) {
    case KonserveBoyut.Kucuk: {
      print("Toplam maliyet: ${30 * adet} ₺");
    }
    break;
    case KonserveBoyut.Orta: {
      print("Toplam maliyet: ${80 * adet} ₺");
    }
    break;
    case KonserveBoyut.Buyuk: {
      print("Toplam maliyet: ${140 * adet} ₺");
    }
    break;
  }
}