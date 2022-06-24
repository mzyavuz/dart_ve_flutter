import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yemek_siparis_uygulamasi/cubit/sepet_ekrani_cubit.dart';
import 'package:yemek_siparis_uygulamasi/model/yemek.dart';

class SepetEkrani extends StatefulWidget {
  final String kullanici_adi;
  SepetEkrani({Key? key, required this.kullanici_adi}) : super(key: key);

  @override
  State<SepetEkrani> createState() => _SepetEkraniState();
}

class _SepetEkraniState extends State<SepetEkrani> {
  @override
  void initState() {
    super.initState();
    context.read<SepetEkraniCubit>().sepettekiYemekleriYukle(widget.kullanici_adi);
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
          BlocBuilder<SepetEkraniCubit, List<Yemek>>(
              builder: (context, sepettekiYemekListesi) {
                if (sepettekiYemekListesi.isNotEmpty) {
                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                          (BuildContext context, int index) {
                        var yemek = sepettekiYemekListesi[index];
                        String resimUrl = "http://kasimadalan.pe.hu/yemekler/resimler/";
                        return GestureDetector(
                          onTap: () {
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
                                  child: SizedBox(
                                    height: 70,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(yemek.yemek_adi),
                                        Text("${yemek.yemek_fiyat} ₺"),
                                        Text("${yemek.yemek_siparis_adet} tane"),
                                      ],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(18.0),
                                  child: IconButton(onPressed: () {
                                    context.read<SepetEkraniCubit>().yemegiSil(int.parse(yemek.sepet_yemek_id!), widget.kullanici_adi);
                                  }, icon: const Icon(Icons.remove)),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                      childCount: sepettekiYemekListesi.length,
                    ),
                  );
                } else if (sepettekiYemekListesi.isEmpty) {
                  return SliverList(delegate: SliverChildListDelegate([
                    const Center(child: Text("Lütfen Sepetinize Ürün Ekleyin!")),
                  ]));
                } else {
                  return SliverList(delegate: SliverChildListDelegate([const Center()]));
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
