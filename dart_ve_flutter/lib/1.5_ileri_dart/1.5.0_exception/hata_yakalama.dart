void main() {
  var liste = <String>[];
  liste.add("Ahmet"); //0.index
  liste.add("Zeynep"); //1.index




  try{
    //hata olabilcecek kodlama buraya gelecek
    String isim = liste[3]; //Exception!!!
    print("Gelen isim: $isim");
  }catch(e){
    print("Listenin boyutunu aştınız.");
  } //UYGULAMA ÇÖKMEDİ VE HATAYI YÖNETEBİLDİK
}