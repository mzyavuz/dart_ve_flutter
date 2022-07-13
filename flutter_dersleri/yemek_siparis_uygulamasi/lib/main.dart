import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yemek_siparis_uygulamasi/cubit/order_page_cubit.dart';
import 'package:yemek_siparis_uygulamasi/cubit/foods_page_cubit.dart';
import 'package:yemek_siparis_uygulamasi/cubit/food_detail_page_cubit.dart';
import 'package:yemek_siparis_uygulamasi/cubit/sign_in_page_cubit.dart';
import 'package:yemek_siparis_uygulamasi/cubit/sign_up_page_cubit.dart';
import 'package:yemek_siparis_uygulamasi/views/main_page.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
        BlocProvider(create: (context) => OrderPageCubit(),),
        BlocProvider(create: (context) => SignInPageCubit(),),
        BlocProvider(create: (context) => SignUpPageCubit(),)
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

