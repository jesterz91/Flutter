import 'dart:math';

abstract class Shape {
  // factory 생성자
  factory Shape(String type) {
    if (type == 'circle') return Circle(2);
    if (type == 'square') return Square(2);
    throw 'Can\'t create $type.';
  }
  num get area;
}

class Circle implements Shape {
  final num radius;
  Circle(this.radius);
  num get area => pi * pow(radius, 2);
}

class Square implements Shape {
  final num side;
  Square(this.side);
  num get area => pow(side, 2);
}

// 모든 클래스는 interface 를 정의하기 때문에 키워드가 없음.
class CircleMock implements Circle {
  num area;
  num radius;
}

// top-level 함수
Shape shapeFactory(String type) {
  if (type == 'circle') return Circle(2);
  if (type == 'square') return Square(2);
  throw 'Can\'t create $type.';
}

main() {  
  final circle = shapeFactory('circle');
  final square = Shape('square');  
  
  print(circle.area); // 12.566370614359172
  print(square.area); // 4
}
