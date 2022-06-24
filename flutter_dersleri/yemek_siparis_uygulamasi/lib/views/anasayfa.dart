import 'package:flutter/material.dart';
import 'package:yemek_siparis_uygulamasi/views/siparis_ekrani.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({Key? key}) : super(key: key);

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  var tfKullanici = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Anasayfa"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text("Zeynep Restoran'a Hoşgeldiniz"),
            Padding(
              padding: const EdgeInsets.only(left: 50.0, right: 50),
              child: TextField(
                controller: tfKullanici,
                decoration: const InputDecoration(hintText: "Kullanıcı Adını Giriniz"),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (context) => SiparisEkrani(kullanici_adi: tfKullanici.text),));
              },
              child: const Text("Sipariş Ver")),
          ],
        ),
      ),
    );
  }
}