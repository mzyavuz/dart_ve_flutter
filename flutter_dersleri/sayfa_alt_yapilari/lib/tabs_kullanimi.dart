import 'package:flutter/material.dart';
import 'package:sayfa_alt_yapilari/sayfa_bir.dart';
import 'package:sayfa_alt_yapilari/sayfa_iki.dart';
import 'package:sayfa_alt_yapilari/sayfa_uc.dart';

class TabsKullanimi extends StatefulWidget {
  const TabsKullanimi({Key? key}) : super(key: key);

  @override
  State<TabsKullanimi> createState() => _TabsKullanimiState();
}

class _TabsKullanimiState extends State<TabsKullanimi> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3, //Tab sayısı
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.green,
          title: const Text("Tabs Kullanımı"),
          bottom: const TabBar(
            tabs: [
              Tab(text: "Bir", icon: Icon(Icons.looks_one),),
              Tab(text: "İki", icon: Icon(Icons.looks_two)),
              Tab(text: "Üç", icon: Icon(Icons.looks_3)),
            ],
            indicatorColor: Colors.orange,
            labelColor: Colors.greenAccent,
          ),
        ),
        body: const TabBarView( //TabBar'sız da kullanılıyor
          children: [
            SayfaBir(),
            SayfaIki(),
            SayfaUc(),
          ],
        ),
      ),
    );
  }
}
