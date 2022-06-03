import 'package:calisma_yapisi/kisiler.dart';
import 'package:calisma_yapisi/sonuc_ekrani.dart';
import 'package:flutter/material.dart';

class OyunEkrani extends StatefulWidget {
  Kisiler kisi;
  OyunEkrani({required this.kisi});

  @override
  State<OyunEkrani> createState() => _OyunEkraniState();
}


class _OyunEkraniState extends State<OyunEkrani> {

  Future<bool> geriDonusTusu(BuildContext context) async {
    print('Navigation geri tuşu tıklandı');
    return true;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Oyun Ekranı'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_sharp),
          onPressed: () {
            print('Appbar geri tuşu tıklandı');
            Navigator.pop(context);
          },
        ),
      ),
      body: WillPopScope(
        onWillPop: () => geriDonusTusu(context),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('${widget.kisi.ad} - ${widget.kisi.yas} - ${widget.kisi.boy} - ${widget.kisi.bekar}'),
              ElevatedButton(onPressed: (){
                Navigator.pushReplacement(context, //pushReplacement backstate'ten silinmesini sağlıyor
                    MaterialPageRoute(
                      builder: (context) => const SonucEkrani(),)
                );
              }, child: const Text('BİTTİ'),),
            ],
          ),
        ),
      ),
    );
  }
}
