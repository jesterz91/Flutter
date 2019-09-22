import 'package:flutter/material.dart';
import 'package:material_components/model/product.dart';
import 'package:material_components/model/products_repository.dart';
import 'package:material_components/util/asymmetric_view.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('SHRINE'),
        leading: IconButton(
          icon: Icon(
            Icons.menu,
            semanticLabel: 'menu',
          ),
          onPressed: () {
            print('Menu button');
          },
        ),
        actions: <Widget>[
          IconButton(
            icon: Icon(
              Icons.search,
              semanticLabel: 'search',
            ),
            onPressed: () {
              print('Search button');
            },
          ),
          IconButton(
            icon: Icon(
              Icons.tune,
              semanticLabel: 'filter',
            ),
            onPressed: () {
              print('Filter button');
            },
          ),
        ],
      ),
      body: AsymmetricView(products: ProductsRepository.loadProducts(Category.all)),
      resizeToAvoidBottomInset: false,
    );
  }

//  List<Card> _buildGridCards(BuildContext context) {
//    List<Product> products = ProductsRepository.loadProducts(Category.all);
//
//    if (products == null || products.isEmpty) {
//      return const <Card>[];
//    }
//
//    final ThemeData theme = Theme.of(context);
//    final NumberFormat formatter = NumberFormat.simpleCurrency(
//        locale: Localizations.localeOf(context).toString());
//
//    return products.map((product) {
//      return Card(
//        elevation: 0,
//        clipBehavior: Clip.antiAlias,
//        child: Column(
//          crossAxisAlignment: CrossAxisAlignment.center,
//          children: <Widget>[
//            AspectRatio(
//              aspectRatio: 18 / 11,
//              child: Image.asset(
//                product.assetName,
//                package: product.assetPackage,
//                fit: BoxFit.fitWidth,
//              ),
//            ),
//            Expanded(
//              child: Padding(
//                padding: EdgeInsets.fromLTRB(16.0, 12.0, 16.0, 8.0),
//                child: Column(
//                  mainAxisAlignment: MainAxisAlignment.end,
//                  crossAxisAlignment: CrossAxisAlignment.center,
//                  children: <Widget>[
//                    Text(
//                      product == null ? '' : product.name,
//                      style: theme.textTheme.button,
//                      softWrap: false,
//                      overflow: TextOverflow.ellipsis,
//                      maxLines: 1,
//                    ),
//                    SizedBox(height: 4.0),
//                    Text(
//                      product == null ? '' : formatter.format(product.price),
//                      style: theme.textTheme.caption,
//                    ),
//                  ],
//                ),
//              ),
//            ),
//          ],
//        ),
//      );
//    }).toList();
//  }

}