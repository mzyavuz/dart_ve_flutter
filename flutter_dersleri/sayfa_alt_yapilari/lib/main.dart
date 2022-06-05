import 'package:flutter/material.dart';
import 'package:sayfa_alt_yapilari/bottom_kullanimi.dart';
import 'package:sayfa_alt_yapilari/drawer_kullanimi.dart';
import 'package:sayfa_alt_yapilari/tabs_kullanimi.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const DrawerKullanimi(),
    );
  }
}