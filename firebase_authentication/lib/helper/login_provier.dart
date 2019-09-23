import 'package:flutter/material.dart';

class LoginProvider extends ChangeNotifier {
  bool _isJoin = false;

  bool get isJoin => _isJoin;

  void toggle() {
    _isJoin = !_isJoin;
    notifyListeners();
  }
}
