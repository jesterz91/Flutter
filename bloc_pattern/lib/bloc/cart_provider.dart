import 'package:bloc_pattern/bloc/cart_bloc.dart';
import 'package:flutter/widgets.dart';

class CartProvider extends InheritedWidget {

  final CartBloc cartBloc;

  CartProvider({Key key, Widget child, CartBloc cartBloc})
      : cartBloc = cartBloc ?? CartBloc(),
        super(key: key, child: child);

  @override
  bool updateShouldNotify(InheritedWidget oldWidget) => true;

  static CartBloc of(BuildContext context) =>
      (context.inheritFromWidgetOfExactType(CartProvider) as CartProvider).cartBloc;
}