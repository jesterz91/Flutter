import 'package:bloc_pattern/bloc/cart_bloc.dart';
import 'package:bloc_pattern/bloc/cart_provider.dart';
import 'package:bloc_pattern/main.dart';
import 'package:flutter/material.dart';

class CartPage extends StatefulWidget {
  @override
  _CartPageState createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  @override
  Widget build(BuildContext context) {

    CartBloc cartBloc = CartProvider.of(context);

    return Scaffold(
      appBar: AppBar(title: Text("total"),),
      body: StreamBuilder(
        stream: cartBloc.itemListStream,
        builder: (context, snapshot) {
          var sum = 0;
          if (snapshot.hasData && snapshot.data.length > 0) {
             sum = snapshot.data
                 .map((item) => item.price)
                 .reduce((acc, e) => acc + e);
          }
          return Center(
            child: Text('총 합계 : $sum원', style: TextStyle(fontSize: 30),),
          );
        },
      ),
    );
  }
}
