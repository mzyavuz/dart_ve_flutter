import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yemek_siparis_uygulamasi/cubit/order_page_cubit.dart';
import 'package:yemek_siparis_uygulamasi/model/food.dart';
import 'package:yemek_siparis_uygulamasi/views/components/custom_bottom_navigation_bar.dart';
import 'package:yemek_siparis_uygulamasi/views/components/orange_animated_button.dart';
import 'package:yemek_siparis_uygulamasi/views/foods_page.dart';

class OrderPage extends StatefulWidget {
  final String kullanici_adi;

  const OrderPage({Key? key, required this.kullanici_adi}) : super(key: key);

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  @override
  void initState() {
    super.initState();
    context.read<OrderPageCubit>().loadAllFoodAtCart(widget.kullanici_adi);
  }

  @override
  Widget build(BuildContext context) {
    final OrderPageCubit cubit = OrderPageCubit();
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.8,
            child: CustomScrollView(
              slivers: [
                SliverPersistentHeader(
                  delegate: SliverAppBar(kullanici_adi: widget.kullanici_adi),
                  pinned: true,
                  floating: true,
                ),
                BlocBuilder<OrderPageCubit, List<Food>>(
                    builder: (context, sepettekiYemekListesi) {
                  if (sepettekiYemekListesi.isNotEmpty) {
                    return SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          var yemek = sepettekiYemekListesi[index];
                          yemek.price = int.parse(yemek.yemek_fiyat) *
                              int.parse(yemek.yemek_siparis_adet!);
                          String resimUrl =
                              "http://kasimadalan.pe.hu/yemekler/resimler/";
                          return GestureDetector(
                            onTap: () {},
                            child: Card(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  SizedBox(
                                      height: 150,
                                      child: Image.network(
                                          "$resimUrl${yemek.yemek_resim_adi}")),
                                  Padding(
                                    padding: const EdgeInsets.all(38.0),
                                    child: SizedBox(
                                      height: 70,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(yemek.yemek_adi),
                                          Text("${yemek.yemek_fiyat} ₺"),
                                          Text(
                                              "${yemek.yemek_siparis_adet} tane"),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(18.0),
                                    child: Column(
                                      children: [
                                        IconButton(
                                            onPressed: () {
                                              ScaffoldMessenger.of(context)
                                                  .showSnackBar(
                                                SnackBar(
                                                  content: Text(
                                                    "Do you want to remove ${yemek.yemek_adi} from your cart? ",
                                                    style: const TextStyle(
                                                        color: Colors
                                                            .indigoAccent),
                                                  ),
                                                  backgroundColor: Colors.white,
                                                  action: SnackBarAction(
                                                      label: "Yes",
                                                      textColor: Colors.red,
                                                      onPressed: () {
                                                        context
                                                            .read<
                                                                OrderPageCubit>()
                                                            .deleteFoodFromCart(
                                                                int.parse(yemek
                                                                    .sepet_yemek_id!),
                                                                widget
                                                                    .kullanici_adi);
                                                      }),
                                                ),
                                              );
                                            },
                                            icon: const Icon(Icons.remove)),
                                        Text('Ücret: ${yemek.price} ₺'),
                                      ],
                                    ),
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
                    return SliverList(
                        delegate: SliverChildListDelegate([
                      Padding(
                        padding: const EdgeInsets.all(58.0),
                        child: Column(
                          children: [
                            const Text(
                              "Your Cart is Empty",
                              style: TextStyle(fontSize: 20),
                            ),
                            ColoredAnimatedButton(
                              route: FoodsPage(
                                kullanici_adi: widget.kullanici_adi,
                              ),
                              title: 'Add a Product',
                            )
                          ],
                        ),
                      ),
                    ]));
                  } else {
                    return SliverList(
                        delegate: SliverChildListDelegate([const Center()]));
                  }
                }),
              ],
            ),
          ),
          Row(
            children: [
              BlocBuilder<OrderPageCubit, List<Food>>(
                bloc: cubit,
                builder: (context, cartList) {
                  cubit.loadAllFoodAtCart(widget.kullanici_adi);
                  int totalPrice = 0;
                  totalPrice = cubit.calculateTotalPrice(widget.kullanici_adi, cartList, totalPrice);
                  if (cartList.isNotEmpty) {
                    return Text('Toplam Ücret: $totalPrice');
                  } else {
                   return Text('HATA');
                  }
                },
              ),
              const ColoredAnimatedButton(
                width: 130,
                route: Center(),
                title: 'Cancel',
                color: Colors.grey,
              ),
              const ColoredAnimatedButton(
                width: 130,
                color: Colors.deepOrange,
                route: Center(),
                title: 'Pay',
              )
            ],
          ),
        ],
      ),
      bottomNavigationBar: CustomBottomNavigationBar(
        kullanici_adi: widget.kullanici_adi,
      ),
    );
  }
}

class SliverAppBar extends SliverPersistentHeaderDelegate {
  final String kullanici_adi;

  SliverAppBar({required this.kullanici_adi});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    var adjustedShrinkOffset =
        shrinkOffset > minExtent ? minExtent : shrinkOffset;
    double offset = (minExtent - adjustedShrinkOffset) - 20;
    double topPadding = MediaQuery.of(context).padding.top + 250;

    return Stack(
      alignment: Alignment.centerLeft,
      children: [
        Container(
          height: topPadding + offset,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50)),
              color: Colors.orange),
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
        Padding(
          padding: EdgeInsets.only(top: 30, left: 44 - (shrinkOffset / 5)),
          child: Align(
            alignment: Alignment.topCenter,
            child: Column(
              children: [
                Text(
                  "The Order of",
                  style: TextStyle(
                    fontFamily: 'PatrickHand',
                    fontSize:
                        shrinkOffset > 0 ? (40 - (shrinkOffset * 0.14)) : 40,
                  ),
                ),
                Text(
                  kullanici_adi,
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'PatrickHand',
                    fontSize:
                        shrinkOffset > 0 ? (37 - (shrinkOffset * 0.14)) : 37,
                  ),
                )
              ],
            ),
          ),
        ),
      ],
    );
  }

  @override
  double get maxExtent => 200;

  @override
  double get minExtent => 100;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      oldDelegate.maxExtent != maxExtent || oldDelegate.minExtent != minExtent;
}
