import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yemek_siparis_uygulamasi/cubit/siparis_ekrani_cubit.dart';
import 'package:yemek_siparis_uygulamasi/model/yemek.dart';
import 'package:yemek_siparis_uygulamasi/views/yemek_detay_ekrani.dart';

class SiparisEkrani extends StatefulWidget {
  const SiparisEkrani({Key? key}) : super(key: key);

  @override
  State<SiparisEkrani> createState() => _SiparisEkraniState();
}

class _SiparisEkraniState extends State<SiparisEkrani> {
  @override
  void initState() {
    super.initState();
    context.read<SiparisEkraniCubit>().yemekleriYukle();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverPersistentHeader(
            delegate: SliverAppBar(),
            floating: true,
          ),
          BlocBuilder<SiparisEkraniCubit, List<Yemek>>(
              builder: (context, yemekListesi) {
            if (yemekListesi.isNotEmpty) {
              return SliverList(
                delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                    var yemek = yemekListesi[index];
                    String resimUrl = "http://kasimadalan.pe.hu/yemekler/resimler/";
                    return GestureDetector(
                      onTap: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context) => YemekDetayEkrani(yemek: yemek),));
                      },
                      child: Card(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              height: 150,
                              child: Image.network("$resimUrl${yemek.yemek_resim_adi}")),
                            Padding(
                              padding: const EdgeInsets.all(38.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  Text(yemek.yemek_adi),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Text("${yemek.yemek_fiyat} ₺"),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(18.0),
                              child: IconButton(onPressed: () {}, icon: Icon(Icons.add)),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                  childCount: yemekListesi.length,
                ),
              );
            } else {
              return SliverList(delegate: SliverChildListDelegate([
                const Center(child: CircularProgressIndicator()),
              ]));
            }
          }),
        ],
      ),
    );
  }
}

class SliverAppBar extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        Container(
          height:100,
          color: Colors.blue,
        ),
        IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_sharp,
            color: Colors.white,
          ),
        ),
        Align(
            child: Text("Zeynep Restoran")),
      ],
    );
  }

  @override
  double get maxExtent => 300;

  @override
  double get minExtent => 150;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      oldDelegate.maxExtent != maxExtent || oldDelegate.minExtent != minExtent;
}
