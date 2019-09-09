// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility that Flutter provides. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:fine_dust/air_result.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

void main() {
  test("http 통신 테스트", () async {
    final apiKey = "YOUR_API_KEY";
    var response = await http.get("http://api.airvisual.com/v2/nearest_city?key=$apiKey");
    var result = AirResult.fromJson(jsonDecode(response.body));

    expect(result.status, "success");

  });
}
