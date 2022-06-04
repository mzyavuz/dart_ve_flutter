import 'package:flutter/material.dart';

class SabitListeleme extends StatefulWidget {
  const SabitListeleme({Key? key}) : super(key: key);

  @override
  State<SabitListeleme> createState() => _SabitListelemeState();
}

class _SabitListelemeState extends State<SabitListeleme> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Sabit Listeleme")),
      body: ListView(
        children: [
          ListTile(
            leading: const Icon(Icons.wb_sunny),
            title: const Text("Güneş"),
            subtitle: const Text("Güneş altbaşlık"),
            trailing: const Icon(Icons.keyboard_arrow_right),
            onTap: () {
              print("Güneş tıklandı");
            },
          ),
          ListTile(
            leading: const Icon(Icons.brightness_3),
            title: const Text("Ay"),
            subtitle: const Text("Ay altbaşlık"),
            trailing: const Icon(Icons.keyboard_arrow_right),
            onTap: () {
              print("Ay tıklandı");
            },
          ),
          GestureDetector(
            onTap: () {print("Yıldız tıklandı");},
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  children: const [
                    Text("Yıldız"),
                    Spacer(),
                    Icon(Icons.keyboard_arrow_right, color: Colors.black45,)
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
