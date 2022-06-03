
import 'package:flutter/material.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa();

  @override
  State<Anasayfa> createState() => _AnasayfaState();

}

class _AnasayfaState extends State<Anasayfa> {
  final double kazanc = 36.16;


  @override
  Widget build(BuildContext context) {
    final double ekranYuksekligi = MediaQuery.of(context).size.height;

    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
              height: ekranYuksekligi / 13,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Padding(
                    padding: EdgeInsets.all(18.0),
                    child: Icon(
                      Icons.person,
                      size: 30,
                      color: Colors.black26,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: Text(
                      '₺$kazanc',
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.orangeAccent,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: ekranYuksekligi / 10,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(13.0),
                          child: ElevatedButton(
                            onPressed: () {},
                            child: const Text(
                              'Tümü',
                              style: TextStyle(
                                fontFamily: 'Nunito',
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(13.0),
                          child: ElevatedButton(
                            onPressed: () {},
                            child: const Text(
                              'Değerlendirme Bekliyor',
                              style: TextStyle(
                                fontFamily: 'Nunito',
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(13.0),
                          child: ElevatedButton(
                            onPressed: () {},
                            child: const Text(
                              'Aktif Görüşme',
                              style: TextStyle(
                                fontFamily: 'Nunito',
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(
              height: ekranYuksekligi * 0.70,
              child: ListView(children: const [
                SoruBilgilendirme(
                    ucret: 0.50,
                    ders: 'Lise Matematik',
                    tarih: '05.02.2022',
                    konu: 'Birinci Dereceden Denklemler'),
                SoruBilgilendirme(
                    ucret: 0.40,
                    ders: 'Ortaokul Matematik',
                    tarih: '05.02.2022',
                    konu: 'Problemler'),
                SoruBilgilendirme(
                    ucret: 0.50,
                    ders: 'Ortaokul Matematik',
                    tarih: '04.02.2022',
                    konu: 'Üçgenler'),
                SoruBilgilendirme(
                    ucret: 0.40,
                    ders: 'Ortaokul Matematik',
                    tarih: '04.02.2022',
                    konu: 'Problemler'),
                SoruBilgilendirme(
                    ucret: 0.30,
                    ders: 'Lise Matematik',
                    tarih: '03.02.2022',
                    konu: 'Açılar'),
              ]),
            ),
          ],
        ),
      ),
      floatingActionButton: SizedBox(
        height: 50,
        width: 130,
        child: FloatingActionButton.large(
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0)
          ),
          onPressed: () {  },
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: const [
              Icon(Icons.add),
              Text('Soru Al', style: TextStyle(fontFamily: 'Nunito', fontWeight: FontWeight.bold),),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(items: const [
        BottomNavigationBarItem(icon: Icon(Icons.folder_copy), label: 'Soru Kutusu', tooltip: 'Soru Kutusu'),
        BottomNavigationBarItem(icon: Icon(Icons.bar_chart), label: 'İstatistikler'),
        BottomNavigationBarItem(icon: Icon(Icons.card_giftcard), label: 'Davet Et'),
      ],

      ),
    );
  }
}

class SoruBilgilendirme extends StatelessWidget {
  final String ders;
  final String tarih;
  final String konu;
  final double ucret;

  const SoruBilgilendirme({
    Key? key,
    required this.ders,
    required this.tarih,
    required this.konu,
    required this.ucret,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(18.0),
          child: Image.network(
              height: 70,
              width: 100,
              'https://images.pexels.com/photos/356079/pexels-photo-356079.jpeg?auto=compress&cs=tinysrgb&w=800'),
        ),
        SizedBox(
          width: 220,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
              children: [
            SizedBox(
              width: 220,
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(ders, style: const TextStyle(fontWeight: FontWeight.bold),),
                  Text(tarih, style: const TextStyle(fontSize: 11, color: Colors.black38),),
                ],
              ),
            ),
            Text(konu),
            Text('Kazanç yansıtıldı: ₺$ucret', style: const TextStyle(color: Colors.black38),),
          ]),
        ),
      ],
    );
  }
}
