import 'dart:collection';

void main(){

  //Tanımlama
  var plakalar = HashSet.from([16,23,6]);
  var meyveler = HashSet<String>();

  //Değer atama
  meyveler.add("Kiraz");
  meyveler.add("Muz");
  meyveler.add("Portakal");
  print(meyveler);

  meyveler.add("Muzx");
  print(meyveler);

  String m = meyveler.elementAt(2);
  print("2.index : $m");

  for(var m in meyveler) {
    print("Sonuc: $m");
  }

  for(var i=0; i<meyveler.length;i++) {
    print("$i. -> ${meyveler.elementAt(i)}");
  }


  meyveler.remove("Muz");
  print(meyveler);

  meyveler.clear();
  print(meyveler);

}