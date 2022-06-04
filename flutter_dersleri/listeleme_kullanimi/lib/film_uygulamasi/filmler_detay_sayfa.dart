import 'package:flutter/material.dart';
import 'package:listeleme_kullanimi/film_uygulamasi/filmler.dart';

class FilmlerDetaySayfa extends StatefulWidget {
  Filmler film;

  FilmlerDetaySayfa({required this.film});

  @override
  State<FilmlerDetaySayfa> createState() => _FilmlerDetaySayfaState();
}

class _FilmlerDetaySayfaState extends State<FilmlerDetaySayfa> {
  @override
  Widget build(BuildContext context) {
    var f = widget.film;
    return Scaffold(
      appBar: AppBar(
        title: Text(f.filmAdi),
        backgroundColor: Colors.deepPurple,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset("resimler/${f.filmResimAdi}"),
            Text(f.filmAdi, style: const TextStyle(fontSize: 48),),
            Text("${f.filmFiyat} ₺", style: const TextStyle(fontSize: 40, color: Colors.blue),),
            const SizedBox(
              width: 200,
              height: 50,
            ),
            ElevatedButton(
              onPressed: () {
                print("${f.filmAdi} kiralandı");
              },
              style: ElevatedButton.styleFrom(primary: Colors.red),
              child: const Text("Kirala", style: TextStyle(color: Colors.white),),
            ),
          ],
        ),
      ),
    );
  }
}
