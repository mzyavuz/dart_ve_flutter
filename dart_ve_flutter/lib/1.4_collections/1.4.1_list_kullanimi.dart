void main() {
  //Tanımlama

  //Yöntem1:Baştan değer atama
  var plakalar = [16,23,6];

  //Yöntem2:boş bir liste oluşturup içini doldurma
  var meyveler = <String>[]; //List<String>

  meyveler.add("Muz"); //0.idex
  meyveler.add("Kiraz"); //1.index
  meyveler.add("Elma"); //2.index

  print(meyveler);

  //Güncelleme
  meyveler[1] = "Yeni Kiraz";
  print(meyveler);

  //İnsert
  meyveler.insert(1, "Portakal"); //1.indexe portakal ekleyip ötekileri kaydırıyor
  print(meyveler);

  //Veri okuma
  String m = meyveler[3];
  print("3.index: $m");

  //For each
  for(var m in meyveler) {
    print("Sonuc : $m");
  }

  for(var i=0; i < meyveler.length; i++) {
    print("$i. indeksteki veri: ${meyveler[i]}");
  }

  print(meyveler.isEmpty);
  print(meyveler.contains("Muz"));

  var liste = meyveler.reversed;
  print(liste);

  meyveler.sort();
  print(meyveler);

  //plakalar.sort();
  //print(plakalar); Küçükten büyüğe

  meyveler.removeAt(1);
  print(meyveler);

  meyveler.clear(); //bütün liste silinir
  print(meyveler);
}