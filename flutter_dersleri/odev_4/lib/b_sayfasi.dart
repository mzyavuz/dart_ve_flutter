import 'package:flutter/material.dart';
import 'package:odev_4/y_sayfasi.dart';

class BSayfasi extends StatefulWidget {
  const BSayfasi({Key? key}) : super(key: key);

  @override
  State<BSayfasi> createState() => _BSayfasiState();
}

class _BSayfasiState extends State<BSayfasi> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('B Sayfası'),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ElevatedButton(onPressed: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) => const YSayfasi(),));
            }, child: Text('Y Sayfasına Git')),
          ],
        ),
      ),
    );
  }
}
