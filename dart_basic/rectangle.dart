import 'dart:math';

class Rectangle{
  int width;
  int height;
  Point origin;
  // Java 에서 네 개의 생성자를 모두 대체하는 하나의 빈 생성자.
  Rectangle({this.origin = const Point(0, 0), this.width = 0, this.height = 0});
  
  @override
  String toString() => 'Origin: (${origin.x}, ${origin.y}), width: $width, height: $height';
}

void main() {
  print(Rectangle(origin: const Point(10, 20), width: 100, height: 200)); // Origin: (10, 20), width: 100, height: 200
  print(Rectangle(origin: const Point(10, 10))); // Origin: (10, 10), width: 0, height: 0
  print(Rectangle(width: 200)); // Origin: (0, 0), width: 200, height: 0
  print(Rectangle()); // Origin: (0, 0), width: 0, height: 0
}
