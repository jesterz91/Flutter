String scream(int length) => "A${'a' * length}h!";

main() {
  final values = [1, 2, 3, 5, 10, 50];
  // 명령형 스타일
  for (var length in values) {
    print(scream(length));
  }
  // 함수형 스타일
  values.skip(1).take(3).map(scream).forEach(print);
}
