import 'package:flutter/material.dart';

class HesapMakinesi extends StatefulWidget {
  const HesapMakinesi({Key? key}) : super(key: key);

  @override
  State<HesapMakinesi> createState() => _HesapMakinesiState();
}

class _HesapMakinesiState extends State<HesapMakinesi> {
  double sayi = 0;
  bool islemeBasildiMi = false;
  bool sayiVarMi = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hesap Makinesi'),
        centerTitle: true,
      ),
      body: Column(
        children: [
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
                  IslemButonu(isaret: 'AC',),
                  IslemButonu(isaret: '±',),
                  IslemButonu(isaret: '%'),
                  IslemButonu(isaret: '÷'),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                 Expanded(
                   child: Padding(
                     padding: const EdgeInsets.all(8.0),
                     child: GestureDetector(
                       onTap: () {
                         setState(() {
                           sayi = 7;
                           sayiVarMi = true;
                         });
                       },
                       child: Container(
                         decoration: BoxDecoration(
                           color: Colors.grey,
                         ),
                           child: Text('7')
                       ),
                     ),
                   ),
                 ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            sayi = 8;
                          });
                        },
                        child: Text('8'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                            sayi = 9;
                          });
                        },
                        child: Text('9'),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ElevatedButton(
                        onPressed: () {
                          setState(() {
                          });
                        },
                        child: Text('x'),
                      ),
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

class IslemButonu extends StatefulWidget {
  String isaret;
  IslemButonu({
    Key? key, required this.isaret,
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
              setState( () {
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
