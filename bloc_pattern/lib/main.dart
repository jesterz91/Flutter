import 'package:bloc_pattern/bloc/cart_bloc.dart';
import 'package:bloc_pattern/bloc/cart_provider.dart';
import 'package:bloc_pattern/catalog.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return CartProvider(
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: MainPage(title: 'Main Page'),
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  MainPage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: RaisedButton(
          child: Text('show catalog'),
          color: Colors.amber,
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => CatalogPage())),
        ),
      ),
    );
  }
}
