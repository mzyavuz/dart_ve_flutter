import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'anasayfa_cubit.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({Key? key}) : super(key: key);

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {
  int sonuc = 0;

  var tfSayi1 = TextEditingController();
  var tfSayi2 = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Bloc Pattern Kullanımı"),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 50, right: 50),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                BlocBuilder<AnasayfaCubit, int>(
                  builder: (context, sonuc) {
                    return Text(
                      sonuc.toString(),
                      style: const TextStyle(fontSize: 30),
                    );
                  },
                ),
                TextField(
                  controller: tfSayi1,
                  decoration: const InputDecoration(hintText: "Sayı 1"),
                ),
                TextField(
                  controller: tfSayi2,
                  decoration: const InputDecoration(hintText: "Sayı 2"),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        String alinanSayi1 = tfSayi1.text;
                        String alinanSayi2 = tfSayi2.text;
                        context.read<AnasayfaCubit>().toplamaYap(alinanSayi1, alinanSayi2);
                      },
                      child: const Text(
                        "TOPLAMA",
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        String alinanSayi1 = tfSayi1.text;
                        String alinanSayi2 = tfSayi2.text;
                        context.read<AnasayfaCubit>().carpmaYap(alinanSayi1, alinanSayi2);
                      },
                      child: const Text(
                        "ÇARPMA",
                      ),
                    ),
                  ],
                ),
              ]
          ),
        ),
      ),
    );
  }
}
