class Item{
  String title;
  int price;

  Item(this.title, this.price);

  @override
  String toString() => 'Item{title: $title, price: $price}';
}