import 'package:flutter/material.dart';

class SabitListelemeGrid extends StatefulWidget {
  const SabitListelemeGrid({Key? key}) : super(key: key);

  @override
  State<SabitListelemeGrid> createState() => _SabitListelemeGridState();
}

class _SabitListelemeGridState extends State<SabitListelemeGrid> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sabit Listeleme")),
      body: GridView.count( //kutucuklu gösterme
        crossAxisCount: 3,
        childAspectRatio: 2 / 2,  //soldaki genişliği, sağdaki yüksekliği temsil ediyor
        children: [
          GestureDetector(
            onTap: () {print("Güneş tıklandı");},
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.wb_sunny, color: Colors.black45,),
                    Text("Güneş"),
                  ],
                ),
              ),
            ),
          ),GestureDetector(
            onTap: () {print("Ay tıklandı");},
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.brightness_3, color: Colors.black45,),
                    Text("Ay"),
                  ],
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {print("Yıldız tıklandı");},
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.star, color: Colors.black45,),
                    Text("Yıldız"),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
