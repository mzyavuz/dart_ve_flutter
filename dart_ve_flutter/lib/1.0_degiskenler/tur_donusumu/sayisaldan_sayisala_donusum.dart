void main() {
  /*
  Sayısaldan sayılasala dönüşüm:
  En tehlikeli ve riskli dönüşüm o yüzden çok uygulamamak lazım
   */

  int i = 42;
  double d = 67.89;

  double sonuc1 = i.toDouble(); // 42'yi double a dönüştürüp sonuc1 e atıyor
  print(sonuc1);

  int sonuc2 = d.toInt();
  print(sonuc2); // küsüratını atıyor bu da çok büyük sıkıntı oluşturabilir (yuvarlamıyor)

}