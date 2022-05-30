import 'package:flutter/material.dart';
import 'package:kisiler_uygulamasi/views/kisi_kayit_sayfa.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({Key? key}) : super(key: key);

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kişiler'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [

          ],
        )
      ),
      floatingActionButton: FloatingActionButton.extended(
        icon: const Icon(Icons.add),
        label: const Text('Kayıt'),
        //backgroundColor: Colors.deepPurple,
        //foregroundColor: Colors.amberAccent,
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => const KisiKayitSayfa()));
        },

      ),
    );
  }
}
