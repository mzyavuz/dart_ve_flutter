import 'package:calisma_yapisi/kisiler.dart';
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
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Oyun Ekranı'),
        leading: IconButton(
          icon: Icon(Icons.arrow_back_ios_sharp),
          onPressed: () {
            print('Appbar geri tuşu tıklandı');
            Navigator.of(context).pop();
          },
        ),
      ),
      body: WillPopScope(
        onWillPop: () => geriDonusTusu(context),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [

            ],
          ),
        ),
      ),
    );
  }
}
