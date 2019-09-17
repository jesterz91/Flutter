import 'package:bloc_pattern/model/item.dart';
import 'package:rxdart/rxdart.dart';

enum CartEventType{
  add, remove
}

class CartEvent{
  final CartEventType type;
  final Item item;

  CartEvent(this.type, this.item);
}

class CartBloc{

  List<Item> itemList = [
    Item("라이젠5", 250000),
    Item("16G RAM", 70000),
    Item("250G SSD", 60000),
    Item("1T HDD", 40000),
    Item("RTX 2060", 40000),
    Item("600W 파워", 35000),
  ];

  final _cartItemList = List<Item>();
  final _cartSubject = BehaviorSubject<List<Item>>.seeded([]);

  Stream<List<Item>> get itemListStream => _cartSubject.stream;

  void updateItem(CartEvent event) {
    switch(event.type) {
      case CartEventType.add:
        _cartItemList.add(event.item);
        break;
      case CartEventType.remove:
        _cartItemList.remove(event.item);
        break;
    }
    _cartSubject.add(_cartItemList);
  }

}