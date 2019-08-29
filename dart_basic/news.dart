import 'dart:async';

void main() {
  _printNews1(); // 2초후 출력
  _printNews2(); // 1초후 출력
}

// async/await 키워드 사용
void _printNews1() async {
  try {
    var info = await _getNews(2);
    print(info);
  } catch(e) {
    print(e.toString());
  }
}

// Future API 사용
void _printNews2() {
  var info = _getNews(1);
  
  info.then((value) => {
    print(value)
  });
  info.catchError((error) => {
    print(error)
  });
}

Future<String> _getNews(int second) =>
  Future.delayed(Duration(seconds: second), () => "Take ${second} second");
