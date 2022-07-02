import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yemek_siparis_uygulamasi/cubit/foods_page_cubit.dart';
import 'package:yemek_siparis_uygulamasi/model/food.dart';
import 'package:yemek_siparis_uygulamasi/views/components/custom_bottom_navigation_bar.dart';
import 'package:yemek_siparis_uygulamasi/views/food_detail_page.dart';

class FoodsPage extends StatefulWidget {
  final String kullanici_adi;

  const FoodsPage({Key? key, required this.kullanici_adi}) : super(key: key);

  @override
  State<FoodsPage> createState() => _FoodsPageState();
}

class _FoodsPageState extends State<FoodsPage> {
  @override
  void initState() {
    super.initState();
    context.read<FoodsPageCubit>().loadAllFoods();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
          slivers: [
            SliverPersistentHeader(
              delegate: SliverAppBar(),
              pinned: true,
              floating: true,
            ),
            BlocBuilder<FoodsPageCubit, List<Food>>(
                builder: (context, yemekListesi) {
              if (yemekListesi.isNotEmpty) {
                return SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      var yemek = yemekListesi[index];
                      String resimUrl =
                          "http://kasimadalan.pe.hu/yemekler/resimler/";
                      return GestureDetector(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => FoodDetailPage(
                                    yemek: yemek,
                                    kullanici_adi: widget.kullanici_adi),
                              ));
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                          child: Card(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                SizedBox(
                                    height: 150,
                                    child: Image.network(
                                        "$resimUrl${yemek.yemek_resim_adi}")),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Text(yemek.yemek_adi,
                                    style: const TextStyle(
                                      fontFamily: 'PatrickHand',
                                      fontSize: 22,
                                    ),),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Text("${yemek.yemek_fiyat} ₺",
                                      textAlign: TextAlign.center,
                                      style: const TextStyle(
                                        fontSize: 18,
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(18.0),
                                  child: IconButton(
                                      onPressed: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                              builder: (context) => FoodDetailPage(
                                                  yemek: yemek,
                                                  kullanici_adi: widget.kullanici_adi),
                                            ));
                                      }, icon: const Icon(Icons.add)),
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                    childCount: yemekListesi.length,
                  ),
                );
              } else {
                return SliverList(
                    delegate: SliverChildListDelegate([
                  const Center(child: CircularProgressIndicator()),
                ]));
              }
            }),
          ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(kullanici_adi: widget.kullanici_adi,),
    );
  }
}

class SliverAppBar extends SliverPersistentHeaderDelegate {
  var tfSearchController = TextEditingController();

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    double topPadding = MediaQuery.of(context).padding.top + 200;

    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        ClipRRect(
          borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(50),
              bottomRight: Radius.circular(50)),
          child: Container(
            height: topPadding,
            color: Colors.orange,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 28.0),
          child: Align(
            alignment: Alignment.topLeft,
            child: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios_sharp,
                color: Colors.white,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.only(top: 30, left: 44-(shrinkOffset/5) ),
          child: Align(
            alignment: Alignment.topCenter,
            child: Text("What would you like to order?",
            style: TextStyle(
              fontFamily: 'PatrickHand',
              fontSize: shrinkOffset > 0 ? (40 - (shrinkOffset*0.05) ) : 40,
            ),),),
        ),
        Align(
          alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.only(top: 10, left: 30.0, right: 30.0),
              child: SizedBox(
                height: 52,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  child: TextField(
                      controller: tfSearchController,
                      decoration: InputDecoration(
                        suffixIcon: const Icon(Icons.search),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.white,
                            width: 2.0,
                          ),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: const BorderSide(
                            color: Colors.white70,
                            width: 2.0,
                          ),
                        ),
                        hintText: 'Search Food',
                        hintStyle: const TextStyle(
                          color: Colors.grey,
                        ),
                      )),
                ),
              ),
            ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => 200;

  @override
  double get minExtent => 120;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      oldDelegate.maxExtent != maxExtent || oldDelegate.minExtent != minExtent;
}
