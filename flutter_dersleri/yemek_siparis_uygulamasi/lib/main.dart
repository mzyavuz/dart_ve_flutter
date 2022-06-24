import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:yemek_siparis_uygulamasi/cubit/sepet_ekrani_cubit.dart';
import 'package:yemek_siparis_uygulamasi/cubit/siparis_ekrani_cubit.dart';
import 'package:yemek_siparis_uygulamasi/cubit/yemek_detay_cubit.dart';
import 'package:yemek_siparis_uygulamasi/views/anasayfa.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => SiparisEkraniCubit(),),
        BlocProvider(create: (context) => YemekDetayCubit(),),
        BlocProvider(create: (context) => SepetEkraniCubit(),)
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Anasayfa(),
      ),
    );
  }
}

