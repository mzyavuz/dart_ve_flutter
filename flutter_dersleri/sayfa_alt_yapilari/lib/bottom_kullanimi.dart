import 'package:flutter/material.dart';
import 'package:sayfa_alt_yapilari/sayfa_bir.dart';
import 'package:sayfa_alt_yapilari/sayfa_iki.dart';
import 'package:sayfa_alt_yapilari/sayfa_uc.dart';

class BottomNavigationKullanimi extends StatefulWidget {
  const BottomNavigationKullanimi({Key? key}) : super(key: key);

  @override
  State<BottomNavigationKullanimi> createState() => _BottomNavigationKullanimiState();
}

class _BottomNavigationKullanimiState extends State<BottomNavigationKullanimi> {
  int secilenIndeks = 0;
  var sayfaListesi = [const SayfaBir(), const SayfaIki(), const SayfaUc()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Bottom Navigation Kullanımı"), backgroundColor: Colors.deepPurple,),
      body: sayfaListesi[secilenIndeks],
      bottomNavigationBar: BottomNavigationBar(
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.looks_one), label: "Bir"),
          BottomNavigationBarItem(icon: Icon(Icons.looks_two), label: "İki"),
          BottomNavigationBarItem(icon: Icon(Icons.looks_3), label: "Üç"),
        ],
        currentIndex: secilenIndeks,
        backgroundColor: Colors.deepPurple,
        selectedItemColor: Colors.orange,
        unselectedItemColor: Colors.white38,
        onTap: (indeks) {
          setState((){
            secilenIndeks = indeks;
          });
        },
      ),
    );
  }
}
