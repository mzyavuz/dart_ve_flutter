import 'dart:async';

import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Anasayfa(),
    );
  }
}

class Anasayfa extends StatefulWidget {
  const Anasayfa({Key? key}) : super(key: key);

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  Completer<GoogleMapController> haritaKontrol = Completer();
  //41.1621951,28.8890015,13z
  var baslangicKonum = const CameraPosition(target: LatLng(41.1621951,28.8890015), zoom: 13);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Harita Kullanımı"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: 300,
              height: 300,
              child: GoogleMap(
                initialCameraPosition: baslangicKonum,
                mapType: MapType.normal,
                onMapCreated: (GoogleMapController controller) {
                  haritaKontrol.complete(controller);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
