class Bicycle {
  int _speed = 0;
  int get speed => _speed;
  int cadence;
  int gear;
  
  Bicycle(this.cadence, this.gear);
  
  void applyBrake(int decrement) {
    _speed -= decrement;
  }

  void speedUp(int increment) {
    _speed += increment;
  }
  
  @override
  String toString() => 'Bicycle: $speed mph';

}

void main() {
  //Bicycle bicycle = new Bicycle(2, 0, 1);
  var bike = Bicycle(2, 1);
  print(bike);
}
