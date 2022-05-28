void main() {

  //Null safety - nullable - optional
  /*
  Bir değişkenin boş olması yüzünden napacağını şaşırması
  Sistemin yapılarını kullanırken bizi zorladığı bir şey
   */
  String str = "Hello";

  String? isim = null; //? : bu değer null olabilir veya farklı değerler alabilir ona göre hareket et.
  // nil = null;

  isim = "Ahmet";

  //Yöntem 1: ? null ise çökmez, değilse çalışır (tanımlarken kullandığımız ile farklı)
  print("Sonuc1: ${isim?.toUpperCase()}"); //Güvenli bir yöntem

  //Yöntem 2: ! null olduğunda çöker
  print("Sonuc2: ${isim!.toUpperCase()}"); // Koduma güveniyorum ve null olmadığına eminim, riskli bir yöntem

  //Yöntem 3: if kontrol (en çok kullanılan yöntem)
  if (isim != null){
    print("Sonuc3: ${isim.toUpperCase()}");
  } else {
    print("İsim null ve işlem yapılmadı");
  }

}