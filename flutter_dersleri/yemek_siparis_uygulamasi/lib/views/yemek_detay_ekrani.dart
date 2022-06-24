import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yemek_siparis_uygulamasi/cubit/yemek_detay_cubit.dart';
import 'package:yemek_siparis_uygulamasi/model/yemek.dart';
import 'package:yemek_siparis_uygulamasi/views/sepet_ekrani.dart';

class YemekDetayEkrani extends StatefulWidget {
  final Yemek yemek;
  final String kullanici_adi;

  const YemekDetayEkrani({Key? key, required this.yemek, required this.kullanici_adi}) : super(key: key);

  @override
  State<YemekDetayEkrani> createState() => _YemekDetayEkraniState();
}

class _YemekDetayEkraniState extends State<YemekDetayEkrani> {
  int adetSayisi = 0;

  @override
  Widget build(BuildContext context) {
    var yemek = widget.yemek;
    String resimUrl = "http://kasimadalan.pe.hu/yemekler/resimler/";
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network("$resimUrl${yemek.yemek_resim_adi}"),
            Text(yemek.yemek_adi),
            Text("${yemek.yemek_fiyat} ₺"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text("Adet:"),
                IconButton(
                  onPressed: () {
                    setState(() {
                      adetSayisi -= 1;
                    });
                  },
                  icon: const Icon(Icons.remove)),
                Text(adetSayisi.toString()),
                IconButton(
                  onPressed: () {
                    setState(() {
                      adetSayisi += 1;
                    });
                  },
                  icon: const Icon(Icons.add))
              ],
            ),
            ElevatedButton(
              onPressed: () {
                context.read<YemekDetayCubit>().sepeteYemekEkle(yemek.yemek_adi, yemek.yemek_resim_adi, int.parse(yemek.yemek_fiyat), adetSayisi, widget.kullanici_adi);
              }, 
              child: const Text("Sepete Ekle")),
            ElevatedButton(
                onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => SepetEkrani(kullanici_adi: widget.kullanici_adi),));
                },
                child: const Text("Sepete Git")),
          ],
        ),
      ),
    );
  }
}
