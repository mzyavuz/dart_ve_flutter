import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Anasayfa(),
    );
  }
}

class Anasayfa extends StatefulWidget {
  const Anasayfa({Key? key}) : super(key: key);

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {

  int sayac = 0;

  @override
  void initState() {
    super.initState();
    //test();
    sayacKontrol();
  }

  Future<void> test() async {
    var sp = await SharedPreferences.getInstance(); //yetkimiz

    //Veri kaydı
    sp.setString("ad", "Ahmet"); //bir kere kaydettikten sonra kalıcı oluyor
    sp.setInt("yas", 23);
    sp.setDouble("boy", 1.78);
    sp.setBool("bekar", true);

    var arkadasListe = <String>[];
    arkadasListe.add("Ece");
    arkadasListe.add("Ali");

    sp.setStringList("arkadasListe", arkadasListe);

    //Veri silme
    //sp.remove("ad");

    //Veri okuma
    String gelenAd = sp.getString("ad") ?? "isim yok"; //?? sonrasındaki varsayılan değer
    int gelenYas = sp.getInt("yas") ?? 0;
    double gelenBoy = sp.getDouble("boy") ?? 0.0;
    bool gelenBekar = sp.getBool("bekar") ?? false;
    var gelenArkadasListe = sp.getStringList("arkadasListe") ?? null;

    print("Gelen Ad: $gelenAd");
    print("Gelen Yas: $gelenYas");
    print("Gelen Boy: $gelenBoy");
    print("Gelen Bekar: $gelenBekar");

    if (gelenArkadasListe != null) {
      print("Gelen Liste: $gelenArkadasListe");
      for (var a in gelenArkadasListe) {
        print("Arkadas : $a");
      }
    }

  }

  Future<void> sayacKontrol() async {
    var sp = await SharedPreferences.getInstance();

    sayac = sp.getInt("sayac") ?? 0;

    setState(() {
      sayac +=1;
    });

    sp.setInt("sayac", sayac);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sayaç Uygulaması"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Açılış Sayısı : $sayac", style: const TextStyle(fontSize: 50),),
          ],
        ),
      ),
    );
  }
}

