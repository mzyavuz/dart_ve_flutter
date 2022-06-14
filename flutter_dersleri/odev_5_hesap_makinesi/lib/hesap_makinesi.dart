import 'package:flutter/material.dart';

import 'islemler.dart';

class HesapMakinesi extends StatefulWidget {
  const HesapMakinesi({Key? key}) : super(key: key);

  @override
  State<HesapMakinesi> createState() => _HesapMakinesiState();
}

class _HesapMakinesiState extends State<HesapMakinesi> {
  double sayi = 0;
  double sayi1 = 0;
  double sayi2 = 1;
  bool islemeBasildiMi = false;
  bool sayiVarMi = false;

  @override
  Widget build(BuildContext context) {
    final islem = Islemler();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hesap Makinesi'),
        centerTitle: true,
      ),
      body: Column(children: [
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: SizedBox(
            width: MediaQuery.of(context).size.width,
            child: Text(
              '$sayi',
              textAlign: TextAlign.end,
              style: const TextStyle(
                fontSize: 25,
              ),
            ),
          ),
        ),
        Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IslemButonu(
                  isaret: 'AC',
                  islem: islem.sifirla(sayi),
                ),
                IslemButonu(isaret: '±', islem: islem.eksiDegeri(sayi)),
                IslemButonu(
                  isaret: '%',
                  islem: islem.yuzdesi(sayi),
                ),
                IslemButonu(
                  isaret: '÷',
                  islem: islem.bolme(sayi, sayi2),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          sayiVarMi ? sayi = (sayi * 10 + 7) : sayi = 7;
                          sayiVarMi = true;
                        });
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.grey,
                        primary: Colors.white70,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                      ),
                      child: const Text('7'),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          sayiVarMi ? sayi = (sayi * 10 + 8) : sayi = 8;
                          sayiVarMi = true;
                        });
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.grey,
                        primary: Colors.white70,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                      ),
                      child: const Text('8'),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          sayiVarMi ? sayi = (sayi * 10 + 9) : sayi = 9;
                          sayiVarMi = true;
                        });
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.grey,
                        primary: Colors.white70,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                      ),
                      child: const Text('9'),
                    ),
                  ),
                ),
                IslemButonu(isaret: 'x', islem: islem.carpma(sayi, sayi2)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          sayiVarMi ? sayi = (sayi * 10 + 4) : sayi = 4;
                          sayiVarMi = true;
                        });
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.grey,
                        primary: Colors.white70,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                      ),
                      child: const Text('4'),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          sayiVarMi ? sayi = (sayi * 10 + 5) : sayi = 5;
                          sayiVarMi = true;
                        });
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.grey,
                        primary: Colors.white70,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                      ),
                      child: const Text('5'),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          sayiVarMi ? sayi = (sayi * 10 + 6) : sayi = 6;
                          sayiVarMi = true;
                        });
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.grey,
                        primary: Colors.white70,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                      ),
                      child: const Text('6'),
                    ),
                  ),
                ),
                IslemButonu(isaret: '-', islem: islem.cikarma(sayi, sayi2)),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          sayiVarMi ? sayi = (sayi * 10 + 1) : sayi = 1;
                          sayiVarMi = true;
                        });
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.grey,
                        primary: Colors.white70,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                      ),
                      child: const Text('1'),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          sayiVarMi ? sayi = (sayi * 10 + 2) : sayi = 2;
                          sayiVarMi = true;
                        });
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.grey,
                        primary: Colors.white70,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                      ),
                      child: const Text('2'),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          sayiVarMi ? sayi = (sayi * 10 + 3) : sayi = 3;
                          sayiVarMi = true;
                        });
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.grey,
                        primary: Colors.white70,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                      ),
                      child: const Text('3'),
                    ),
                  ),
                ),
                Expanded(
                    child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          sayi1 = sayi;
                          sayi = 0;
                        });
                      },
                      child: Text('+')),
                )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(
                  width: 190,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextButton(
                      onPressed: () {
                        setState(() {
                          sayi = 0;
                        });
                      },
                      style: TextButton.styleFrom(
                        backgroundColor: Colors.grey,
                        primary: Colors.white70,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                      ),
                      child: const Text('0'),
                    ),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {});
                  },
                  style: TextButton.styleFrom(
                    backgroundColor: Colors.grey,
                    primary: Colors.white70,
                    shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(20))),
                  ),
                  child: const Text(','),
                ),
                SizedBox(
                  width: 90,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            sayi2 = sayi;
                            sayi = sayi1 + sayi2;
                          });},
                        child: Text('=')),
                  ),
                ),
              ],
            ),
          ],
        ),
      ]),
    );
  }
}

class IslemButonu extends StatefulWidget {
  final String isaret;
  final double islem;

  const IslemButonu({
    Key? key,
    required this.isaret,
    required this.islem,
  }) : super(key: key);

  @override
  State<IslemButonu> createState() => _IslemButonuState();
}

class _IslemButonuState extends State<IslemButonu> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ElevatedButton(
          onPressed: () {
            setState(() {
              widget.islem;
            });
          },
          child: Text(
            widget.isaret,
          ),
        ),
      ),
    );
  }
}
