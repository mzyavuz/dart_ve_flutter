import 'package:flutter/material.dart';
import 'package:listeleme_kullanimi/appbar_kullanimi.dart';
import 'package:listeleme_kullanimi/film_uygulamasi/filmler_sayfa.dart';
import 'package:listeleme_kullanimi/sabit_listeleme.dart';
import 'package:listeleme_kullanimi/sabit_listeleme_grid.dart';
import 'package:listeleme_kullanimi/yemek_uygulamasi/yemekler_sayfa.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const FilmlerSayfa(),
    );
  }
}
