import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:odev_7_todo_app/cubit/adding_page_cubit.dart';
import 'package:odev_7_todo_app/cubit/detail_page_cubit.dart';
import 'package:odev_7_todo_app/cubit/homepage_cubit.dart';

import 'views/homepage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (context) => HomepageCubit()),
        BlocProvider(create: (context) => AddingPageCubit()),
        BlocProvider(create: (context) => DetailPageCubit()),
      ],
      child: MaterialApp(
        title: 'ToDo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const Homepage(),
      ),
    );
  }
}


