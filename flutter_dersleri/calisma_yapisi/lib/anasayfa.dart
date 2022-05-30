import 'package:calisma_yapisi/kisiler.dart';
import 'package:calisma_yapisi/oyun_ekrani.dart';
import 'package:flutter/material.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({Key? key}) : super(key: key);

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> with WidgetsBindingObserver {
  int sayac = 0;
  bool kontrol = false;



  @override
  void initState() {
    super.initState();
    print("initState çalıştı");
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void dispose() {
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  Future<int> faktoriyelHesaplama(int sayi) async {
    int sonuc = 1;

    for (var i=1; i <= sayi; i++) {
      sonuc = sonuc*i;
    }

    return sonuc;
  }


  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if(state == AppLifecycleState.inactive) {print('inactive çalıştı');}
    if(state == AppLifecycleState.paused) {print('paused çalıştı');}
    if(state == AppLifecycleState.resumed) {print('resumed çalıştı');}
    if(state == AppLifecycleState.detached) {print('detached çalıştı');}
  }

  @override
  Widget build(BuildContext context) {
    print('build calisti');
    return Scaffold(
      appBar: AppBar(title: const Text('Anasayfa')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text('Sonuc : $sayac'),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  sayac = sayac + 1;
                },);
              },
              child: const Text('Tıkla'),
            ),
            ElevatedButton(
              onPressed: () {
                var kisi = Kisiler(ad: 'Ahmet', yas: 23, boy: 1.78, bekar: true);
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => OyunEkrani(kisi: kisi)))
                    .then((_) => { print("Anasayfaya geri dönüldü")});
              },
              child: const Text('Başla'),
            ),
            Visibility(visible: kontrol, child: const Text("Merhaba"),),
            Text(
              sayac > 3 ? 'Merhaba': 'x', //Ternary operator
              style: TextStyle(
                  color: kontrol ? Colors.blue : Colors.red, //Ternary operator
              ),
            ),
            ((){ //Farklı widgetlar kullanırken olabilir.
              if (kontrol) {
                return const Text("Merhaba");
              } else {
                return const Text("X");
              }
            }()),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  kontrol = true;
                });
              },
              child: const Text('DURUM 1 (True)'),
            ),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  kontrol = false;
                });              },
              child: const Text('DURUM 2 (False)'),
            ),
            FutureBuilder<int>(
              future: faktoriyelHesaplama(5),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return const Text('Hata Oluştu');
                }
                if (snapshot.hasData) {
                  return Text("Sonuc: ${snapshot.data}");
                } else {
                  return const Text("Sonuç yok");
                }
              },
            ),
          ],
        ),
      )
    );
  }
}
