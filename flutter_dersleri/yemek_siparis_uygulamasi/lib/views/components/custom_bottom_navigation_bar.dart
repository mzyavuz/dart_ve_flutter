import 'package:flutter/material.dart';
import 'package:yemek_siparis_uygulamasi/views/foods_page.dart';
import 'package:yemek_siparis_uygulamasi/views/login_page.dart';
import 'package:yemek_siparis_uygulamasi/views/order_page.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final String kullanici_adi;

  const CustomBottomNavigationBar({
    Key? key,
    required this.kullanici_adi,
  }) : super(key: key);


  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.orange,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(icon: const Icon(Icons.home), onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => FoodsPage(kullanici_adi: widget.kullanici_adi),));
          },),
          IconButton(icon: const Icon(Icons.shopping_basket), onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => OrderPage(kullanici_adi: widget.kullanici_adi),));

          },),
          IconButton(
            icon: const Icon(Icons.person), onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => const LoginPage(),));

          },),
        ],
      ),
    );
  }
}
