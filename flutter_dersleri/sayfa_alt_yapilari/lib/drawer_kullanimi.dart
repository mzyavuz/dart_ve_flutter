import 'package:flutter/material.dart';
import 'package:sayfa_alt_yapilari/sayfa_bir.dart';
import 'package:sayfa_alt_yapilari/sayfa_iki.dart';
import 'package:sayfa_alt_yapilari/sayfa_uc.dart';

class DrawerKullanimi extends StatefulWidget {
  const DrawerKullanimi({Key? key}) : super(key: key);

  @override
  State<DrawerKullanimi> createState() => _DrawerKullanimiState();
}

class _DrawerKullanimiState extends State<DrawerKullanimi> {
  int secilenIndeks = 0;
  var sayfaListesi = [const SayfaBir(), const SayfaIki(), const SayfaUc()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Drawer Kullanımı"),
        backgroundColor: Colors.deepPurple,
      ),
      body: sayfaListesi[secilenIndeks],
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero, //Kear boşluklarını sıfırlıyor
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.deepPurple,
              ),
              child: Text("Merhaba", style: TextStyle(color: Colors.white, fontSize: 30),),
            ),
            ListTile(
              title: const Text("Bir"),
              leading: const Icon(Icons.looks_one),
              onTap: () {
                setState(() {
                  secilenIndeks = 0;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text("İki"),
              leading: const Icon(Icons.looks_two),
              onTap: () {
                setState(() {
                  secilenIndeks = 1;
                });
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text("Üç"),
              leading: const Icon(Icons.looks_3),
              onTap: () {
                setState(() {
                  secilenIndeks = 2;
                });
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}
