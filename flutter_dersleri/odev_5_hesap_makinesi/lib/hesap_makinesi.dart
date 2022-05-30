import 'package:flutter/material.dart';
import 'package:odev_5_hesap_makinesi/hesap_makinesi_class.dart';

class HesapMakinesi extends StatefulWidget {
  const HesapMakinesi({Key? key}) : super(key: key);

  @override
  State<HesapMakinesi> createState() => _HesapMakinesiState();
}

class _HesapMakinesiState extends State<HesapMakinesi> {
  double sayi = 0;
  islem = Islemler.

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hesap Makinesi'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Text('$sayi'),
          Column(
            children: [
              Row(
                children: [
                  ElevatedButton(
                      onPressed: () {
                        setState( () {

                        });
                      },
                      child: Text(
                        'AC'
                      ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
