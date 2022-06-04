import 'package:flutter/material.dart';
import 'package:kisiler_uygulamasi/entity/kisiler.dart';
import 'package:kisiler_uygulamasi/views/kisi_detay_sayfa.dart';
import 'package:kisiler_uygulamasi/views/kisi_kayit_sayfa.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({Key? key}) : super(key: key);

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  bool aramaYapiliyorMu = false;

  Future<List<Kisiler>> tumKisileriGoster() async {
    var kisilerListesi = <Kisiler>[];
    var k1 = Kisiler(kisi_id: 1, kisi_ad: "Ahmet", kisi_tel: "1111");
    var k2 = Kisiler(kisi_id: 2, kisi_ad: "Zeynep", kisi_tel: "2222");
    var k3 = Kisiler(kisi_id: 3, kisi_ad: "Beyza", kisi_tel: "3333");
    kisilerListesi.add(k1);
    kisilerListesi.add(k2);
    kisilerListesi.add(k3);
    return kisilerListesi;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: aramaYapiliyorMu ?
        TextField(
          decoration: const InputDecoration(hintText: "Ara"),
          onChanged: (aramaSonucu) {
            print("Arama sonucu: $aramaSonucu");
          },
        ) :
        const Text('Kişiler'),
        actions: [
          aramaYapiliyorMu ?
          IconButton(
            onPressed: () {
              setState((){
                aramaYapiliyorMu = false;
              });
            },
            icon: const Icon(Icons.clear)
          ) :
          IconButton(
              onPressed: () {
                setState((){
                  aramaYapiliyorMu = true;
                });
              },
              icon: const Icon(Icons.search)
          ),
        ],
      ),
      body: FutureBuilder<List<Kisiler>>(
        future: tumKisileriGoster(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            var kisilerListesi = snapshot.data;
            return ListView.builder(
              itemCount: kisilerListesi!.length,
              itemBuilder: (context, indeks) { //index: 0,1,2
                var kisi = kisilerListesi[indeks];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => KisiDetaySayfa(kisi: kisi)));
                  },
                  child: Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Text("${kisi.kisi_ad} - ${kisi.kisi_tel}"),
                          const Spacer(),
                          IconButton(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                SnackBar(
                                  content: Text("${kisi.kisi_ad} silinsin mi?"),
                                  action: SnackBarAction(
                                    label: "Evet",
                                    onPressed: () {
                                      print("Kişi Sil : ${kisi.kisi_id}");
                                    },
                                  ),
                                )
                              );
                            },
                            icon: const Icon(Icons.delete_outline, color: Colors.black45,)),
                        ],
                      ),
                    ),
                  ),
                );
              },
            );
          } else {
            return const Center();
          }
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.add),
        label: const Text('Kayıt'),
        //backgroundColor: Colors.deepPurple,
        //foregroundColor: Colors.amberAccent,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(
              builder: (context) => const KisiKayitSayfa()));
        },

      ),
    );
  }
}
