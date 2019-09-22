import 'package:flutter/material.dart';
import 'package:material_components/screen/home.dart';
import 'package:material_components/screen/login.dart';
import 'package:material_components/theme/app_theme.dart';

void main() => runApp(ShrineApp());

final ThemeData _kShrineTheme = buildShrineTheme();

class ShrineApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Shrine',
      home: HomePage(),
      theme: _kShrineTheme,
      initialRoute: '/login',
      onGenerateRoute: _getRoute,
    );
  }

  Route<dynamic> _getRoute(RouteSettings settings) {
    if (settings.name != '/login') {
      return null;
    }

    return MaterialPageRoute<void>(
      settings: settings,
      builder: (BuildContext context) => LoginPage(),
      fullscreenDialog: true,
    );
  }
}