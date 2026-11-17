import 'package:cart_screen/bloc/cart_bloc.dart';
import 'package:cart_screen/screen/home_scree.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(create: (context) => CartBloc(),
    child: 
    MaterialApp(
      title: 'Flutter Demo',
      home: HomeScree(),
    )
    );
  }
}
