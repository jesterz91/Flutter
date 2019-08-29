import 'dart:async';

void main() async {
  
  countStream(3)
    .transform(transformer)
    .listen((value) => {print("transform $value")});
  
  var bcStream = countStream(5).asBroadcastStream();
  
  bcStream.listen((value) => {
    print("again value $value")
  });
  
  print("총합 : ${await sumStream(bcStream)}");
}

var transformer = new StreamTransformer<int, String>.fromHandlers(handleData: (value, sink) {
  sink.add("value : $value");
});

Stream<int> countStream(int to) async* {
  for (int i = 1; i <= to; i++) {
    await Future.delayed(const Duration(seconds: 1));
    yield i; // Stream에 데이터 전달
  }
}

Future<int> sumStream(Stream<int> stream) async {
  var sum = 0;
  await for (var value in stream) {
    sum += value;
    print("sum value $sum");
  }
  return sum;
}
