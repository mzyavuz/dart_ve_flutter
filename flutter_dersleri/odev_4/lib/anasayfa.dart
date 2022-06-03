import 'package:flutter/material.dart';
import 'package:odev_4/a_sayfasi.dart';
import 'package:odev_4/x_sayfasi.dart';

import 'b_sayfasi.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({Key? key}) : super(key: key);

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Anasayfa'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const ASayfasi(),));
            }, child: const Text('A Sayfasına Git')),
            ElevatedButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const XSayfasi(),));
            }, child: const Text('X Sayfasına Git')),
          ],
        ),
      ),
    );
  }
}
