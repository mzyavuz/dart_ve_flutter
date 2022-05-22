import 'dart:collection';

void main(){
  //Tanımlama
  var sayilar = {"Bir": 1,"İki": 2}; //key : value
  var iller = HashMap<int,String>();

  //Değer atama
  iller[16] = "BURSA";
  iller[34] = "İSTANBUL";
  print(iller);

  //Güncelleme
  iller[16] = "YENİ BURSA";
  print(iller);

  //Veri Okuma
  String il = iller[34]!;
  print("34 key: $il");

  print(iller.length);
  print(iller.isEmpty);
  print(iller.containsKey(17));
  print(iller.containsValue("İSTANBUL"));

  var anahtarlar = iller.keys; //keyleri verir

  for(var a in anahtarlar) {
    print("$a -> ${iller[a]}");
  }

  //key tabanlı silme
  iller.remove(16);
  print(iller);

  iller.clear();
  print(iller);

}