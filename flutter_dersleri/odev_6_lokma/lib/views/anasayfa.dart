import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:odev_6_lokma/cubit/yemekler_cubit.dart';
import 'package:odev_6_lokma/model/yemek.dart';

class Anasayfa extends StatefulWidget {
  const Anasayfa({Key? key}) : super(key: key);

  @override
  State<Anasayfa> createState() => _AnasayfaState();
}

class _AnasayfaState extends State<Anasayfa> {

  @override
  void initState() {
    super.initState();
    context.read<YemeklerCubit>().yemekleriYukle();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 17,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Lokma',
            style: TextStyle(
                fontFamily: 'SantElia',
                fontSize: 37,
                fontWeight: FontWeight.bold),
          ),
          backgroundColor: Colors.white,
          bottom: const TabBar(
            isScrollable: true,
            indicatorColor: Colors.black,
            unselectedLabelColor: Colors.grey,
            tabs: [
              Tab(
                text: "BUGÜN",
              ),
              Tab(
                text: "HAMUR İŞİ",
              ),
              Tab(
                text: "TATLILAR",
              ),
              Tab(
                text: "PASTANE",
              ),
              Tab(
                text: "ATIŞTIRMALIK",
              ),
              Tab(
                text: "HAFİF VE SAĞLIKLI",
              ),
              Tab(
                text: "ÇORBALAR",
              ),
              Tab(
                text: "ANA YEMEKLER",
              ),
              Tab(
                text: "ZEYTİNYAĞLILAR",
              ),
              Tab(
                text: "SALATALAR",
              ),
              Tab(
                text: "PİLAV",
              ),
              Tab(
                text: "MAKARNA",
              ),
              Tab(
                text: "KAHVALTILIK",
              ),
              Tab(
                text: "İÇECEKLER",
              ),
              Tab(
                text: "YÖRESEL",
              ),
              Tab(
                text: "KİLER",
              ),
              Tab(
                text: "TÜM TARİFLER",
              ),
            ],
          ),
        ),
        drawer: const Drawer(),
        body: BlocBuilder<YemeklerCubit, List<Yemek>>(
            builder: (context, yemeklerListesi) {
              if (yemeklerListesi.isNotEmpty) {
                return CustomScrollView(slivers: [
                  SliverList(
                    delegate: SliverChildListDelegate([
                      SizedBox(
                        height: 50,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          padding: const EdgeInsets.all(5),
                          children: [
                            Row(
                              children: const [
                                Padding(
                                  padding: EdgeInsets.all(5.0),
                                  child: CircleAvatar(
                                    backgroundColor: Colors.black38,
                                    maxRadius: 13,
                                    child: Icon(
                                      Icons.sort,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                                YaziButonu(yazi: 'Tümü', color: Colors.black, textColor: Colors.white),
                                YaziButonu(yazi: 'Et', color: Colors.transparent, textColor: Colors.grey),
                                YaziButonu(yazi: 'Balık', color: Colors.transparent, textColor: Colors.grey),
                                YaziButonu(yazi: 'Tavuk', color: Colors.transparent, textColor: Colors.grey),
                                YaziButonu(yazi: 'Sebze', color: Colors.transparent, textColor: Colors.grey),
                                YaziButonu(yazi: 'Bakliyat', color: Colors.transparent, textColor: Colors.grey),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ]),
                  ),
                  SliverGrid(
                    delegate: SliverChildBuilderDelegate(
                      childCount: yemeklerListesi.length,
                      (context, int index) {
                        var yemek = yemeklerListesi[index];
                        return YemekKarti(yemek: yemek);
                      },
                    ),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 65 / 100,
                    ),
                  ),
                ]);
              } else {
                return const Center();
              }
            }),
        floatingActionButton: FloatingActionButton.extended(
          elevation: 0,
          backgroundColor: Colors.yellow,
          label: const Text('Filtrele'),
          icon: const Icon(Icons.filter_alt_outlined),
          onPressed: () {},
        ),
        bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          iconSize: 25,
          selectedItemColor: Colors.red,
          selectedFontSize: 9,
          unselectedItemColor: Colors.grey,
          unselectedFontSize: 9,
          selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
          showUnselectedLabels: true,
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home_outlined), label: "ANASAYFA"),
            BottomNavigationBarItem(
                icon: Padding(
                  padding: EdgeInsets.only(bottom: 5.0),
                  child: FaIcon(FontAwesomeIcons.mitten),
                ), label: "MUTFAĞA GİRİŞ"),
            BottomNavigationBarItem(icon: Icon(Icons.search), label: "ARA"),
            BottomNavigationBarItem(
                icon: Icon(Icons.book_outlined), label: "TARİF DEFTERİ"),
            BottomNavigationBarItem(
                icon: Icon(Icons.shopping_bag_outlined), label: "A.LİSTESİ"),
          ],
        ),
      ),
    );
  }
}

class YemekKarti extends StatelessWidget {
  const YemekKarti({
    Key? key,
    required this.yemek,
  }) : super(key: key);

  final Yemek yemek;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 0.3,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.network(
            yemek.yemekFotosu,
            fit: BoxFit.cover,
            alignment: Alignment.topCenter,
            width: 240,
            height: 190,
          ),
          Row(
            children: [
              const Padding(
                padding: EdgeInsets.all(5.0),
                child: Icon(Icons.watch_later_outlined,size: 15,color: Colors.black38,),
              ),
              Text(
                yemek.yemekSuresi,
                style: const TextStyle(
                  color: Colors.black38,
                  fontFamily: 'Montserrat',
                  fontWeight: FontWeight.w700,
                  fontSize: 12,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 5.0, left: 7.0, right: 5.0),
            child: Text(
              yemek.yemekAdi,
              textAlign: TextAlign.start,
              style: const TextStyle(
                fontSize: 18,
                fontFamily: 'Montserrat',
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const Spacer(),
          const Padding(
            padding: EdgeInsets.all(3.0),
            child: Align(
              alignment: AlignmentDirectional.bottomEnd,
                child: Icon(
                  Icons.bookmark_border_outlined,
                  color: Colors.black38,
                ),
            ),
          ),
        ],
      ),
    );
  }
}

class YaziButonu extends StatelessWidget {
  final String yazi;
  final Color textColor;
  final Color color;

  const YaziButonu({Key? key, required this.yazi, required this.textColor, required this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: TextButton(
        style: TextButton.styleFrom(
          minimumSize: const Size.fromWidth(40),
          maximumSize: const Size.fromWidth(110),
          backgroundColor: color,
          shape: RoundedRectangleBorder(
            side: BorderSide(
              color: textColor,
            ),
            borderRadius: const BorderRadius.all(Radius.circular(20)),
          ),
        ),
        onPressed: () {},
        child: Text(
          yazi,
          style: TextStyle(
            color: textColor,
            fontSize: 12,
          ),
        ),
      ),
    );
  }
}
