Future<void> main() async{
  print("Verilerin alınması bekleniyor...");
  var veri = await veritabanindanVeriAl(); //Bir sonraki satır ççalıştı bekleyemediğinden gösteremedi, await eklemeliyiz
  //await: Bu kodun çalışmasını bekle
  print("Veri alınıyor...");
  print("Alınan veri : $veri");

}

Future<String> veritabanindanVeriAl() async { //Gelecekte bir işlem yapacak ve bu asenkron olacak

  for(var i=1; i<=5; i++) {
    Future.delayed(Duration(seconds: i), () => print("Alınan veri miktarı : %${i*20}"));
  }

  return Future.delayed(Duration(seconds: 5), () => "Veritabanı veri kümesi");
}