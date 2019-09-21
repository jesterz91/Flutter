import 'package:flutter/material.dart';
import 'package:flutter_app/bloc/idol_bloc.dart';
import 'package:flutter_app/bloc/counter_bloc.dart';
import 'package:flutter_app/screen/main_page.dart';

void main() => runApp(MyApp());

final counterBloc = CounterBloc();
final idolBloc = IdolBloc();

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MainPage(title: 'Hello Flutter'),
    );
  }
}