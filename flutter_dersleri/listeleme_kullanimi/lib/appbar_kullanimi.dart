import 'package:flutter/material.dart';

class AppBarKullanimi extends StatefulWidget {
  const AppBarKullanimi({Key? key}) : super(key: key);

  @override
  State<AppBarKullanimi> createState() => _AppBarKullanimiState();
}

class _AppBarKullanimiState extends State<AppBarKullanimi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: const [
            Text("Başlık", style: TextStyle(fontSize: 16),),
            Text("Alt Başlık", style: TextStyle(fontSize: 12),),
          ],
        ),
        backgroundColor: Colors.red,
        leading: IconButton(
          onPressed: () {
            print("Leading icon tıklandı");
          },
          icon: Icon(Icons.dehaze),
        ),
        actions: [
          TextButton(
            onPressed: () {
              print("Çıkış tıklandı");
            },
            child: Text("Çıkış", style: TextStyle(color: Colors.white)),
          ),
          IconButton(
            onPressed: () {
              print("Bilgi icon tıklandı");
            },
            icon: Icon(Icons.info_outline),
          ),
          IconButton(
            onPressed: () {
              print("Daha fazla icon tıklandı");
            },
            icon: Icon(Icons.more_vert),
          ),
          PopupMenuButton(
            child: const Icon(Icons.more_vert),
            itemBuilder: (context) => const [
              PopupMenuItem(value:1, child: Text("Sil")),
              PopupMenuItem(value:2, child: Text("Güncelle")),
            ],
            onSelected: (menuItemValue) {
              if (menuItemValue == 1) {print("Sil tıklandı");}
              if (menuItemValue == 2) {print("Güncelle tıklandı");}
            },
          ),
        ],
      ),
      body: Center(),
    );
  }
}
