import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yemek_siparis_uygulamasi/cubit/food_detail_page_cubit.dart';
import 'package:yemek_siparis_uygulamasi/model/food.dart';
import 'package:yemek_siparis_uygulamasi/views/components/custom_bottom_navigation_bar.dart';
import 'package:yemek_siparis_uygulamasi/views/order_page.dart';

class FoodDetailPage extends StatefulWidget {
  final Food yemek;
  final String kullanici_adi;

  const FoodDetailPage({Key? key, required this.yemek, required this.kullanici_adi}) : super(key: key);

  @override
  State<FoodDetailPage> createState() => _FoodDetailPageState();
}

class _FoodDetailPageState extends State<FoodDetailPage> {
  int adetSayisi = 1;

  @override
  Widget build(BuildContext context) {
    var yemek = widget.yemek;
    String resimUrl = "http://kasimadalan.pe.hu/yemekler/resimler/";
    return Scaffold(
      appBar: AppBar(title: Text(yemek.yemek_adi), centerTitle: true,),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.network("$resimUrl${yemek.yemek_resim_adi}"),
            Text(yemek.yemek_adi),
            Text("${yemek.yemek_fiyat} ₺"),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Text("Adet:"),
                IconButton(
                  onPressed: () {
                    setState(() {
                      if (adetSayisi > 1) {
                        adetSayisi -= 1;
                      }
                    });
                  },
                  icon: const Icon(Icons.remove)),
                Text(adetSayisi.toString()),
                IconButton(
                  onPressed: () {
                    setState(() {
                      adetSayisi += 1;
                    });
                  },
                  icon: const Icon(Icons.add))
              ],
            ),
            ElevatedButton(
              onPressed: () {
                context.read<FoodDetailPageCubit>().addToCart(yemek.yemek_adi, yemek.yemek_resim_adi, int.parse(yemek.yemek_fiyat), adetSayisi, widget.kullanici_adi);
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text("$adetSayisi product is added to your cart ", style: TextStyle(color: Colors.indigoAccent),),
                    backgroundColor: Colors.white,
                    duration: const Duration(seconds: 2),
                    action: SnackBarAction(
                        label: "Go to your Cart",
                        textColor: Colors.red,
                        onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => OrderPage(kullanici_adi: widget.kullanici_adi),));
                        }),
                  ),
                );
              }, 
              child: const Text("Sepete Ekle")),
          ],
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(kullanici_adi: widget.kullanici_adi),
    );
  }
}
