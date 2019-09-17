import 'package:bloc_pattern/bloc/cart_bloc.dart';
import 'package:bloc_pattern/bloc/cart_provider.dart';
import 'package:bloc_pattern/cart.dart';
import 'package:bloc_pattern/model/item.dart';
import 'package:flutter/material.dart';

class CatalogPage extends StatefulWidget {
  @override
  _CatalogPageState createState() => _CatalogPageState();
}

class _CatalogPageState extends State<CatalogPage> {
  @override
  Widget build(BuildContext context) {

    CartBloc cartBloc = CartProvider.of(context);

    return Scaffold(
      appBar: AppBar(
        title: Text("catalog"),
        actions: <Widget>[
          IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => CartPage()));
          })
        ],
      ),
      body: StreamBuilder(
        stream: cartBloc.itemListStream,
        builder: (context, snapshot) {
          return ListView.builder(
            itemBuilder: (BuildContext context, int index) {
              return _buildListTile(cartBloc.itemList[index], snapshot.data, cartBloc);
            },
            itemCount: cartBloc.itemList.length,
          );
        },
      ),
    );
  }

  Widget _buildListTile(Item item, List<Item> items, CartBloc cartBloc) {
    final isChecked = items?.contains(item) ?? false;

    return ListTile(
      title: Text(item.title),
      subtitle: Text('${item.price}원'),
      trailing: IconButton(icon: isChecked
          ? Icon(Icons.check, color: Colors.red,)
          : Icon(Icons.check),
          onPressed: () {
            if(!isChecked) {
              cartBloc.updateItem(CartEvent(CartEventType.add, item));
            } else {
              cartBloc.updateItem(CartEvent(CartEventType.remove, item));
            }
          }
      ),
      onTap: () => print(item),
    );
  }
}
