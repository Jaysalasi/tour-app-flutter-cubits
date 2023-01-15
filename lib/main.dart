import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tourism/cubit/app_cubit_logic.dart';
import 'package:tourism/cubit/cubit_cubit.dart';
import 'package:tourism/services/data_services.dart';

// import 'package:tourism/pages/nav_pages/main_page.dart';
// import 'package:tourism/pages/welcome_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider<CubitCubit>(
        create: (context) => CubitCubit(data: DataServices()),
        child: const AppCubitLogic(),
      ),
    );
  }
}
