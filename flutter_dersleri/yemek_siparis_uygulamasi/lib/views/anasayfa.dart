import 'package:flutter/material.dart';
import 'package:yemek_siparis_uygulamasi/views/siparis_ekrani.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({Key? key}) : super(key: key);

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Anasayfa"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text("Zeynep Restoran'a Hoşgeldiniz"),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => const SiparisEkrani(),));
              },
              child: const Text("Sipariş Ver")),
          ],
        ),
      ),
    );
  }
}