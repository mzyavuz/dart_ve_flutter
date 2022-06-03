
import 'package:flutter/material.dart';
import 'package:tasarim_calismasi/renkler.dart';

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
      home: const AnaSayfa(),
    );
  }
}

class AnaSayfa extends StatefulWidget {
  const AnaSayfa({Key? key}) : super(key: key);

  @override
  State<AnaSayfa> createState() => _AnaSayfaState();
}

class _AnaSayfaState extends State<AnaSayfa> {
  @override
  Widget build(BuildContext context) {
    var ekranBilgisi = MediaQuery.of(context);
    final double ekranYuksekligi = ekranBilgisi.size.height;
    final double ekranGenisligi = ekranBilgisi.size.width;
    print('Ekran Yüksekliği: $ekranYuksekligi');
    print('Ekran Genişliği: $ekranGenisligi');

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Pizza",
          style: TextStyle(
            fontFamily: "Pacifico",
            fontSize: 22,
          ),
        ),
        backgroundColor: anaRenk,
        centerTitle: true,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.only(top: ekranYuksekligi/43),
            child: Text('Beef Cheese',
              style: TextStyle(
                color: anaRenk,
                fontSize: ekranGenisligi/11,
                fontWeight: FontWeight.bold
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Image.asset('resimler/pizza_resim.png'),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Chip(icerik: 'Cheese'),
                Chip(icerik: 'Sausage'),
                Chip(icerik: 'Olive',),
                Chip(icerik: 'Pepper',),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Text("20 min",
                  style: TextStyle(
                      fontSize: 22,color: yaziRenk2,fontWeight: FontWeight.bold
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Text("Delivery",
                    style: TextStyle(
                      fontSize: 22,color: anaRenk,fontWeight: FontWeight.bold
                    ),
                  ),
                ),
                Text(
                  "Meat lover, get ready to meet your pizza !",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 22,
                    color: yaziRenk2,
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                Text("\$ 5.98",
                  style: TextStyle(
                    fontSize: 44, color: anaRenk, fontWeight: FontWeight.bold
                  ),
                ),
                const Spacer(),
                SizedBox(
                  width: 200,
                  height: 50,
                  child: TextButton(
                    onPressed: () {},
                    style: TextButton.styleFrom(
                        backgroundColor: anaRenk,
                    ),
                    child: Text(
                      'ADD TO CART',
                      style: TextStyle(
                        color: yaziRenk1,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}


class Chip extends StatelessWidget {
  String icerik;

  Chip({required this.icerik});

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {},
      style: TextButton.styleFrom(
        backgroundColor: anaRenk,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(20)),)),
          child: Text(icerik,style: TextStyle(color: yaziRenk1,),
     ),
    );
  }
}


