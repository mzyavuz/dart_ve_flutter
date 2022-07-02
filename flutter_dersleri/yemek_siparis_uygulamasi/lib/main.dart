import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yemek_siparis_uygulamasi/cubit/order_page_cubit.dart';
import 'package:yemek_siparis_uygulamasi/cubit/foods_page_cubit.dart';
import 'package:yemek_siparis_uygulamasi/cubit/food_detail_page_cubit.dart';
import 'package:yemek_siparis_uygulamasi/views/homepage.dart';
import 'package:yemek_siparis_uygulamasi/views/login_page.dart';
import 'package:yemek_siparis_uygulamasi/views/main_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => FoodsPageCubit(),),
        BlocProvider(create: (context) => FoodDetailPageCubit(),),
        BlocProvider(create: (context) => OrderPageCubit(),)
      ],
      child: MaterialApp(
        title: 'Food Ordering App',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.orange,
        ),
        home: const MainPage(),
      ),
    );
  }
}

