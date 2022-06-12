import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kisiler_uygulamasi/cubit/anasayfa_cubit.dart';
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


  @override
  void initState() {
    super.initState();
    context.read<AnasayfaCubit>().kisileriYukle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: aramaYapiliyorMu ?
        TextField(
          decoration: const InputDecoration(hintText: "Ara"),
          onChanged: (aramaSonucu) {
            context.read<AnasayfaCubit>().ara(aramaSonucu);
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
              context.read<AnasayfaCubit>().kisileriYukle();
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
      body: BlocBuilder<AnasayfaCubit, List<Kisiler>>(
        builder: (context, kisilerListesi) {
          if (kisilerListesi.isNotEmpty) {
            return ListView.builder(
              itemCount: kisilerListesi.length,
              itemBuilder: (context, indeks) { //index: 0,1,2
                var kisi = kisilerListesi[indeks];
                return GestureDetector(
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context) => KisiDetaySayfa(kisi: kisi)))
                        .then((_) {
                      context.read<AnasayfaCubit>().kisileriYukle();
                    });
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
                                      context.read<AnasayfaCubit>().sil(kisi.kisi_id);
                                      //print("Kişi Sil : ${kisi.kisi_id}");
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
              builder: (context) => const KisiKayitSayfa()))
              .then((_) {
                context.read<AnasayfaCubit>().kisileriYukle();
          });
        },

      ),
    );
  }
}
