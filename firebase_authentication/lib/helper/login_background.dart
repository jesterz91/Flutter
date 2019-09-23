import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginBackground extends CustomPainter {

  final bool isJoin;

  LoginBackground({this.isJoin});

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = isJoin ? Colors.red : Colors.indigo;
    canvas.drawCircle(Offset(size.width * 0.5, size.height * 0.2), size.height * 0.5, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) => false;
}
