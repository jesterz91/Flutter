import 'package:flutter/material.dart';
import 'package:material_components/theme/accent_color_override.dart';
import 'package:material_components/theme/colors.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: EdgeInsets.symmetric(horizontal: 24.0),
          children: <Widget>[
            SizedBox(height: 80.0),
            Column(
              children: <Widget>[
                Image.asset('assets/diamond.png'),
                SizedBox(height: 16.0),
                Text('SHRINE'),
                SizedBox(height: 120.0),
                AccentColorOverride(
                  color: kShrineBrown900,
                  child: TextField(
                    controller: _usernameController,
                    decoration: InputDecoration(
                      filled: true,
                      labelText: 'Username',
                    ),
                  ),
                ),
                SizedBox(height: 12.0),
                AccentColorOverride(
                  color: kShrineBrown900,
                  child: TextField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      filled: true,
                      labelText: 'Password',
                    ),
                    obscureText: true,
                  ),
                ),
              ],
            ),
            ButtonBar(
              children: <Widget>[
                FlatButton(
                  child: Text('CANCEL'),
                  onPressed: () {
                    _usernameController.clear();
                    _passwordController.clear();
                  },
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(7.0)),
                  ),
                ),
                RaisedButton(
                  child: Text('NEXT'),
                  elevation: 8.0,
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  shape: BeveledRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(7.0)),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
